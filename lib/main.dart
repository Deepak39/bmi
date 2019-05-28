import "package:flutter/material.dart";
import "bmi/bmi_home.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI",
      theme: new ThemeData(
        primaryColorBrightness: Brightness.dark,
        primaryColor: Colors.pink.shade400,
      ),
      home: new BMIHome(),
    );
  }
}