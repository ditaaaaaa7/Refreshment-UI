import 'package:flutter/material.dart';
import 'package:entertaiment/app/app.dart';
import 'package:entertaiment/app/tabs/home/details/details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YG FAMILY',
      theme: ThemeData(
        fontFamily: "Cera Pro",
        primaryColor: Color(0xFFE85852),
      ),
      routes: {
        'details': (context) => Details(),
      },
      home: App(),
    );
  }
}
