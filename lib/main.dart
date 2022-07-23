import 'package:flutter/material.dart';
import 'package:shabake/presentation/Opportuniies/opportunities_page.dart';

void main() {
  runApp(Shabake());
}

class Shabake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shabake Behdasht',
      showSemanticsDebugger: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: OpportunitiesPage(),
    );
  }
}
