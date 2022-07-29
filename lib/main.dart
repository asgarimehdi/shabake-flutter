import 'package:flutter/material.dart';
import 'package:shabake/router/route_constants.dart';
import 'package:shabake/router/routers.dart';
import 'package:shabake/values/branding_color.dart';

void main() {
  runApp(Shabake());
}

class Shabake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shabake Behdasht',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: brandingColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      onGenerateRoute: Routers.onGenerateRoute,
      initialRoute: signInRoute,
    );
  }
}
