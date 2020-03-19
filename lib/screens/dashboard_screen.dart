import 'package:flutter/material.dart';
import 'package:corona_tracker/screens/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
