import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  bool isMapLoading = true;
  bool isLocPermissionDenied = false;
  bool isLocationDisable = false;

  @override
  void initState() {
    super.initState();
    requestLocation(true);
    getNetworkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today"),
      ),
      body: body(),
    );
  }

  Widget body() {
    if (isMapLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isLocPermissionDenied) {
      return mapError(() async {
        await requestLocation(false);
      }, "Please enable location permission.");
    }

    if (isLocationDisable) {
      return mapError(() async {
        await getCurrentLocation(false);
      }, "Please enable gps");
    }

    return Stack(children: [
      _buildMaps(currentPosition!),
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
                    onPressed: () {},
                    child: const Text("Click In"),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Future requestLocation(bool isFirstTake) async {
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
        await getCurrentLocation(true);
      }
    });
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

  Widget _buildMaps(Position currentPosition) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
          target: LatLng(currentPosition.latitude, currentPosition.longitude),
          zoom: 17),
      onMapCreated: (GoogleMapController controller) {},
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      zoomGesturesEnabled: false,
      scrollGesturesEnabled: false,
    );
  }

  Widget mapError(VoidCallback onRefresh, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              message,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          ElevatedButton(onPressed: onRefresh, child: const Text("Refresh"))
        ],
      ),
    );
  }
}
