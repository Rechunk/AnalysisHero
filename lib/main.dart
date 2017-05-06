import 'package:flutter/material.dart';
import "homeManager.dart";

List<String> derivations = ["", "", ""];
List<List<List<num>>> extremes = [];
String roots = "";
String function = "";
final TextEditingController controller = new TextEditingController();

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kurvendiskussion',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}
