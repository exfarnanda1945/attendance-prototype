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
      appBar: AppBar(
        title: const Text("Today"),
      ),
      body: isMapLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(children: [
              _buildMaps(currentPosition!),
            ]),
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
      final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        currentPosition = location;
        isMapLoading = false;
      });
    } catch (e) {
      setState(() {
        isMapLoading = false;
      });
      rethrow;
    }
  }

  Widget _buildMaps(Position currentPosition) {
    print("here we go ${currentPosition.toString()}");

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
          target: LatLng(currentPosition.latitude, currentPosition.longitude),
          zoom: 17),
      onMapCreated: (GoogleMapController controller) {},
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }
}
