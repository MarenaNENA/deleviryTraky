import 'package:delivery_traky/features/models/Locations.dart';
import 'package:delivery_traky/features/models/Routes.dart';
import 'package:delivery_traky/features/widget/MapWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Maproute extends StatefulWidget {
  final RoutesModel routesModel;
  final List places;
  Maproute({required this.routesModel, required this.places});

  @override
  State<Maproute> createState() => _MaprouteState();
}

class _MaprouteState extends State<Maproute> {
  final MapController mapController = MapController();

  void fitCamera() {
    final point = places.map((place) => place.latLng).toList();
    if (point.length < 2) return;
    final bounds = LatLngBounds.fromPoints(point);
    mapController.fitCamera(
      CameraFit.bounds(bounds: bounds, padding: EdgeInsets.all(80)),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fitCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Column(
              children: [
                Text(
                  'Delivery Traky',
                  style: TextStyle(color: Color(0xff185061), fontSize: 18),
                ),
                Text(
                  'live Tracking',
                  style: TextStyle(color: Colors.black12, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.person_4_outlined, color: Color(0xff185061), size: 30),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Mapwidget(
                mapController: mapController,
                coordinates: widget.routesModel.geometry.coordinates,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.002),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xff185061),
                          ),
                          child: Icon(
                            Icons.timelapse_sharp,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your order will arrive at',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffE8F5F6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'about ${formatDuration(widget.routesModel.duration)} ',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.001),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xffE8F5F6),
                              ),
                              child: Icon(
                                Icons.restaurant_menu,
                                size: 25,
                                color: Color(0xff185061),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '${places[0].name}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffE8F5F6),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Resturant in Zamalik for pizza ',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '|',
                              style: TextStyle(
                                color: Color(0xff185061),
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xff185061),
                              ),
                              child: Icon(
                                Icons.navigation_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),

                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '${places[1].name}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffE8F5F6),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          'your choice of location ',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                ),
                child: Text(
                  'Confirm Order',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(double duration) {
    final totalMinutes = (duration / 60).ceil();

    if (totalMinutes < 60) {
      return '$totalMinutes min';
    }

    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    if (minutes == 0) {
      return '$hours hr';
    }

    return '$hours hr $minutes min';
  }
}
