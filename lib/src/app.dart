import 'package:flutter/material.dart';
import 'package:koronac_na_akci/src/screen/koronac_screen.dart';
import 'package:koronac_na_akci/src/theme.dart';

class App extends StatelessWidget {
  final applicationRoutes = {
    // "/": (context) => HomeScreen(title: 'Flutter Demo Home Page'),
    "/": (context) => KoronacScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildTheme(),
      initialRoute: "/",
      routes: applicationRoutes,
    );
  }
}
