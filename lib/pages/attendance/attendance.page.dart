import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class AttendancePage extends StatefulWidget {
  AttendancePage({super.key, required this.userId, this.isUserClickIn});

  String userId;
  bool? isUserClickIn;

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  late GoogleMapController controller;
  Position? currentPosition;
  String? deviceNetworkName;
  String? deviceNetworkIp;

  @override
  void initState() {
    super.initState();
    requestLocation();
    getCurrentLocation();
    getNetworkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "UserId => ${widget.userId} and isUserClickIn => ${widget.isUserClickIn.toString()}"),
            Text(
                "Position => lat: ${currentPosition?.latitude} and lng: ${currentPosition?.longitude}"),
            Text(
                "Network => Name: $deviceNetworkName and ip: $deviceNetworkIp"),
            ElevatedButton(
                onPressed: () {
                  context.pop(true);
                },
                child: const Text("Close"))
          ],
        ),
      ),
    );
  }

  Future requestLocation() async {
    await Permission.location.request();
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

  getCurrentLocation() async {
    try {
      Position nowLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        currentPosition = nowLoc;
      });
    } catch (e) {
      setState(() {
        currentPosition = null;
      });
      rethrow;
    }
  }
}
