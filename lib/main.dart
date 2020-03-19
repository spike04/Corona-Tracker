import 'package:corona_tracker/app.dart';
import 'package:corona_tracker/bloc/StatProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => StatsProvider(),
          )
        ],
        child: App(),
      ),
    );
