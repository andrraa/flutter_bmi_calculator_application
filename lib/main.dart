import 'package:bmi_application/screens/home.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MyBmiApp(),
  );
}

class MyBmiApp extends StatelessWidget {
  const MyBmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomeScreen(),
    );
  }
}
