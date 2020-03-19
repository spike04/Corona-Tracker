import 'package:corona_tracker/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import './screens.dart' show DashboardScreen;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coronal Tracker',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'GoogleSans',
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: DashboardScreen(),
      ),
    );
  }
}
