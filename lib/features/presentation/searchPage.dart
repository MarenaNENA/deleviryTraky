import 'dart:async';

import 'package:delivery_traky/features/AppRoute.dart';
import 'package:delivery_traky/features/models/mapRouteArgument.dart';
import 'package:delivery_traky/features/service/GetPlacesService.dart';
import 'package:delivery_traky/features/models/Locations.dart';
import 'package:delivery_traky/features/models/placesMode.dart';
import 'package:delivery_traky/features/service/RouteServer.dart';
import 'package:delivery_traky/features/widget/userLocation.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class Searchpage extends StatefulWidget {
  Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController Searchcontroller = TextEditingController();
  Timer? debounceTimer;
  List<placesModel> searchResults = [];
  @override
  void initState() {
    super.initState();
    Searchcontroller.addListener(() {
      debounceTimer?.cancel();

      debounceTimer = Timer(const Duration(milliseconds: 300), () async {
        final query = Searchcontroller.text.trim();
        if (query.isEmpty) {
          setState(() {
            searchResults = [];
          });
          return;
        }
        final result = await Getplacesservice().getPlaces(query);
        if (!mounted) return;
        setState(() {
          searchResults = result;
        });
      });
    });
  }

  @override
  void dispose() {
    debounceTimer?.cancel();
    Searchcontroller.dispose();
    super.dispose();
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: Searchcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xff185061), width: 2),
                  ),
                  hintText: 'Search for a place',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff185061),
                    size: 25,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Searchcontroller.clear();
                    },
                    icon: Icon(Icons.clear, color: Color(0xff185061)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchResults.length,
                itemBuilder: ((context, index) {
                  final plase = searchResults[index];
                  return ListTile(
                    leading: Icon(Icons.location_on_sharp),
                    title: Text(plase.name),
                    subtitle: Text(plase.displayname),
                    onTap: () async {
                      final selaecedLocation = locationModel(
                        name: plase.displayname,
                        latLng: LatLng(plase.lat, plase.lon),
                      );
                      final isCairo = handleLocation().isInsideCairo(
                        plase.lat,
                        plase.lon,
                      );

                      if (!isCairo) {
                        await handleLocation().showCairoOnlyDialog(context);

                        return;
                      }
                      places.add(selaecedLocation);
                      final route = await Routeserver().getRoute(
                        places.map((place) => place.latLng).toList(),
                      );
                      await Navigator.pushNamed(
                        context,
                        Approute.maproude,
                        arguments: MapRouteArguments(
                          routeModel: route,
                          places: places,
                        ),
                      );

                      places.remove(selaecedLocation);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
