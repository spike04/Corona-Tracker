import 'package:corona_tracker/models/CountryStats.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(String lastUpdate) {
  var formatter = DateFormat('d MMM, yyyy');
  return formatter.format(DateTime.parse(lastUpdate));
}

String renderAddress(CountryStats countryStats) {
  if (countryStats.provinceState.isNotEmpty)
    return '${countryStats.provinceState}, ${countryStats.countryRegion}';
  return countryStats.countryRegion;
}

Widget renderInfoCard(String title, int value) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black26,
            BlendMode.hardLight,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff19de92).withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
