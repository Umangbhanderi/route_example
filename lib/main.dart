import 'package:flutter/material.dart';
import 'package:route_example/Utils/routes.dart';
import 'package:route_example/Utils/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.homeScreen,
      onGenerateRoute: Routes.generateRoute,
      // routes: {
      //   HomeScreen.id: (context) => const HomeScreen(),
      //   SecondScreen.id: (context) => const SecondScreen(),
      //   ThirdScreen.id: (context) => const ThirdScreen(),
      // },
    );
  }
}
