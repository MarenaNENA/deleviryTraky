import 'package:delivery_traky/features/AppRoute.dart';
import 'package:delivery_traky/features/models/Locations.dart';
import 'package:delivery_traky/features/models/Routes.dart';
import 'package:delivery_traky/features/models/mapRouteArgument.dart';
import 'package:delivery_traky/features/presentation/homepage.dart';
import 'package:delivery_traky/features/presentation/mapRoute.dart';
import 'package:delivery_traky/features/presentation/searchPage.dart';
import 'package:delivery_traky/features/presentation/spalishScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Approute.splash,
      routes: {
        Approute.splash: (context) => const Spalishscreen(),
        Approute.home: (context) => Homepage(),
        Approute.searchPage: (context) => Searchpage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Approute.maproude) {
          final arg = settings.arguments as MapRouteArguments;
          return MaterialPageRoute(
            builder: (context) =>
                Maproute(routesModel: arg.routeModel, places: arg.places),
          );
        }
      },
    );
  }
}
