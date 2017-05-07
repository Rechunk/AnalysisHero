import 'package:flutter/material.dart';
import "calculateRoots.dart";
import "calculateExtremes.dart";
import "main.dart";
import "functions.dart";

class InputWidget extends StatefulWidget {
  @override
  InputWidgetState createState() => new InputWidgetState();
}

class InputWidgetState extends State<InputWidget> {

  @override
  Widget build(BuildContext context) {

    return new Column(
        children: [
          new Text("Funktion hier eingeben:", style: new TextStyle(fontSize: 20.0, color: Colors.blue, fontFamily: "Raleway")),
          new TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 20.0, color: Colors.blue),
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            iconSize: 40.0,
            color: new Color.fromARGB(255, 88, 88, 88),
            onPressed: () {
              populateDerivations();
              roots = calculateRoots(function).toString();
              //extremes = calculateExtremes(function, derivations[0]);

              navigateToResults(context);
            },
          )
        ]
    );
  }
}
