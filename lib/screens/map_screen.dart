import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
// import 'http';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Location location = Location();
  LocationData? currentLocation;

  GoogleMapController? mapController;

  Future<void> _getUserLocation() async {
    try {
      currentLocation = await location.getLocation();
      setState(() {});
      print("${currentLocation!.latitude}===currentLocation.latitude");
      print("${currentLocation!.longitude}===currentLocation.longitude");
      // Handle the user's current location here
    } catch (e) {
      // Handle errors
    }
  }

  @override
  void initState() {
    _getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Directions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentLocation == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: GoogleMap(
                      // onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            currentLocation!.latitude ?? 0.0,
                            currentLocation!.longitude ??
                                0.0), // Initial map center (San Francisco)
                        zoom: 14.0, // Initial zoom level
                      ),
                      markers: Set<Marker>.of([
                        Marker(
                          markerId: MarkerId('destination'),
                          position: LatLng(currentLocation!.latitude!,
                              currentLocation!.longitude!),
                        ),
                      ]),
                      // Add other map properties and callbacks as needed
                    ),
                  ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
