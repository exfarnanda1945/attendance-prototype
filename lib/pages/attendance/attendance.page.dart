import 'dart:developer';

import 'package:attendance_prototype/models/attendance/attendance_model.dart';
import 'package:attendance_prototype/models/attendance/enter_detail/attendance_enter_detail_model.dart';
import 'package:attendance_prototype/models/attendance/exit_detail/attendance_exit_detail_model.dart';
import 'package:attendance_prototype/models/base/location/location_detail_model.dart';
import 'package:attendance_prototype/models/base/network/network_detail_model.dart';
import 'package:attendance_prototype/pages/attendance/error_maps_attendance.dart';
import 'package:attendance_prototype/pages/attendance/maps_attendance.dart';
import 'package:attendance_prototype/utils/boxes.dart';
import 'package:attendance_prototype/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class AttendancePage extends StatefulWidget {
  AttendancePage(
      {super.key,
      required this.userId,
      required this.isUserClickIn,
      required this.attendanceId});

  String userId;
  bool isUserClickIn;
  String? attendanceId;

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  late GoogleMapController controller;
  Position? currentPosition;
  String? deviceNetworkName;
  String? deviceNetworkIp;
  bool isMapLoading = true;
  bool isLocPermissionDenied = false;
  bool isLocationDisable = false;

  @override
  void initState() {
    super.initState();
    requestLocationAndNetwork(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today"),
      ),
      body: renderBody(),
    );
  }

  Widget renderBody() {
    if (isMapLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isLocPermissionDenied) {
      return ErrorMapsAttendance(
          onRefresh: () async {
            await requestLocationAndNetwork(false);
          },
          message: "Please enable location permission.");
    }

    if (isLocationDisable) {
      return ErrorMapsAttendance(
          onRefresh: () async {
            await getCurrentLocation(false);
          },
          message: "Please enable location permission.");
    }

    return Stack(children: [
      MapsAttendance(position: currentPosition!),
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .23,
          width: double.infinity,
          child: Material(
            elevation: 8,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SSID : $deviceNetworkName",
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  Text("IP: $deviceNetworkIp",
                      style: const TextStyle(fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: upsertAttendance,
                    child:
                        Text(widget.isUserClickIn ? "Click In" : "Click out"),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Future requestLocationAndNetwork(bool isFirstTake) async {
    if (!isFirstTake) {
      setState(() {
        isMapLoading = true;
      });
    }

    await Permission.location.request().then((value) async {
      if (!value.isGranted) {
        setState(() {
          isMapLoading = false;
          isLocPermissionDenied = true;
        });
      }

      if (value.isGranted) {
        await getCurrentLocation(isFirstTake);
      }
    }).whenComplete(() => getNetworkStatus());
  }

  getNetworkStatus() async {
    final networkInfo = NetworkInfo();
    final getWifiName = await networkInfo.getWifiName();
    final getWifiIp = await networkInfo.getWifiIP();

    setState(() {
      deviceNetworkName = getWifiName;
      deviceNetworkIp = getWifiIp;
    });
  }

  getCurrentLocation(bool isFirstTake) async {
    if (!isFirstTake) {
      setState(() {
        isMapLoading = true;
      });
    }

    try {
      final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        currentPosition = location;
        isMapLoading = false;
        isLocationDisable = false;
      });
    } catch (e) {
      setState(() {
        isMapLoading = false;
        isLocationDisable = true;
      });
    }
  }

  upsertAttendance() {
    if (widget.isUserClickIn && widget.attendanceId == null) {
      addAttendance();
    }

    if (!widget.isUserClickIn && widget.attendanceId != null) {
      updateAttendance();
    }
  }

  void addAttendance() {
    AttendanceModel attendanceIn = AttendanceModel(
        id: uuid.v4(),
        userId: widget.userId,
        enter: AttendanceEnterDetailModel(
            location: LocationDetailModel(
                lat: currentPosition!.latitude,
                long: currentPosition!.longitude),
            network: NetworkDetailModel(
                name: deviceNetworkName ?? Constants.unknownAsString,
                ip: deviceNetworkIp ?? Constants.unknownAsString),
            time: DateTime.now()));

    try {
      Boxes.getAttendanceBox().add(attendanceIn);
      Fluttertoast.showToast(msg: "Click in successfully");
      if (mounted) context.pop(true);
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong...");
    }
  }

  void updateAttendance() async {
    final attendances = Boxes.getAttendanceBox().values.toList();
    final attendanceIndex = attendances
        .indexWhere((attendance) => attendance.id == widget.attendanceId);

    if (attendanceIndex != -1) {
      final getAttendance = attendances[attendanceIndex];
      final updateAttendance = getAttendance.copy(
          exit: AttendanceExitDetailModel(
              location: LocationDetailModel(
                  lat: currentPosition!.latitude,
                  long: currentPosition!.longitude),
              network: NetworkDetailModel(
                  name: deviceNetworkName ?? Constants.unknownAsString,
                  ip: deviceNetworkIp ?? Constants.unknownAsString),
              time: DateTime.now()));

      try {
        await Boxes.getAttendanceBox().putAt(attendanceIndex, updateAttendance);
        Fluttertoast.showToast(msg: "Click out successfully");
        if (mounted) context.pop(true);
      } catch (e) {
        print(e.toString());
        Fluttertoast.showToast(msg: "Something went wrong...");
      }
    }
  }
}
