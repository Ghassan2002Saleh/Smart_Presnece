import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Future getData() async {
    LocationPermission per;
    bool service = await Geolocator.isLocationServiceEnabled();
    print(service);
    if (service == false) {
      Center(
        child: Dialog(
          child: Text("not"),
        ),
      );
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    } else {}
  }

  Future<Position> getLatAndLong() async {
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
              child: Text("lat and long"),
              onPressed: () async {
                Position cl = await getLatAndLong();
                print("latitude : ${cl.latitude}\n");
                print("longitude : ${cl.longitude}");
                List<Placemark> placemarks =
                    await placemarkFromCoordinates(cl.latitude, cl.longitude);
                print(placemarks);
              }),
        ),
      ),
    );
  }
}
