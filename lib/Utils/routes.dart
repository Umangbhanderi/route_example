import 'package:flutter/material.dart';
import 'package:route_example/Utils/routes_name.dart';
import 'package:route_example/home_screen.dart';
import 'package:route_example/second_screen.dart';
import 'package:route_example/third_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesName.secondScreen:
        return MaterialPageRoute(
          builder: (context) => SecondScreen(data: settings.arguments as Map),
        );
      case RoutesName.thirdScreen:
        return MaterialPageRoute(
          builder: (context) => ThirdScreen(data: settings.arguments),
        );
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("there is no Route"),
            ),
          );
        });
    }
  }
}
