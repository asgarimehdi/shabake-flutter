import 'package:flutter/material.dart';

class OpportunitiesPage extends StatefulWidget {
   // OpportunitiesPage({Key key}) : super(key: key);
  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}
class _OpportunitiesPageState extends State<OpportunitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opportunities'),
      ),
      body: Center(
        child: Text('Opportunities'),
      ),
    );
  }
}