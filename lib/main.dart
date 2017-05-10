import 'package:flutter/material.dart';
import "homeManager.dart";
import "resultsPage.dart";
import "helpPage.dart";

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

void navigateToResults(BuildContext context){
  Navigator.push(context, new ResultsRoute(
    builder: (_) => new DisplayResultsView()
  ));
}

void navigateToHelp(BuildContext context){
  Navigator.push(context, new HelpRoute(
    builder: (_) => new DisplayHelpView()
  ));
}

// SOME BUG AT MAKEFUNCTION-FUNCTION
