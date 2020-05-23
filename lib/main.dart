import 'package:flutter/material.dart';
import 'package:foodie/screens/home_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Color(0xFFF9C80E),
      ),
      home: Home(),
    );
  }
}
