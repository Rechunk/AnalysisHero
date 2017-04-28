import 'package:flutter/material.dart';
import "calculateDerivations.dart";
import "calculateRoots.dart";

String ersteAbleitung = "";
String zweiteAbleitung = "";
String dritteAbleitung = "";
InputValue val = new InputValue(text: "");
String function = "";
List<int> roots = [];

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Ableitungen berechnen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool navigateToOptions = false;
  List<Widget> widgetsToAdd = [new InputWidget()];

  @override
  Widget build(BuildContext context) {

    List<Widget> children = widgetsToAdd;

    return new Scaffold(
      appBar: new AppBar(title: new Text(config.title)),
      body: new ListView(
        children: children
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            setState(() {

              function = val.text;
              ersteAbleitung = makeFunction(function);
              zweiteAbleitung = makeFunction(ersteAbleitung);
              dritteAbleitung = makeFunction(zweiteAbleitung);

              ersteAbleitung = simplifyFunction(ersteAbleitung);
              zweiteAbleitung = simplifyFunction(zweiteAbleitung);
              dritteAbleitung = simplifyFunction(dritteAbleitung);

              roots = calculateRoots(function);

              if (!navigateToOptions){
                navigateToOptions = true;
                widgetsToAdd = [new DisplayWidget()];
              }
              else {
                navigateToOptions = false;
                widgetsToAdd = [new InputWidget()];
              }
            });
          },
        )
    );
  }
}

class InputWidget extends StatefulWidget {
  @override
  InputWidgetState createState() => new InputWidgetState();
}


class InputWidgetState extends State<InputWidget> {

  String zweiteAbleitung = "";
  String dritteAbleitung = "";
  String roots = "";
  String function = "";

  @override
  Widget build(BuildContext context) {

    return new Column(
        children: [
          new Input(
            value: val,
            labelText: 'Funktion hier eingeben',
            onChanged: (InputValue newInputValue) {
              setState(() {
                val = newInputValue;
              });
          }),
        ]
    );
  }
}

class DisplayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Container(
          padding: new EdgeInsets.all(20.0),
          width: 500.0,
          color: Colors.red,
          child: new Column(
            children: [
              new Text("1. Ableitung: $ersteAbleitung", style: new TextStyle(color: Colors.white)),
              new Text("2. Ableitung: $zweiteAbleitung", style: new TextStyle(color: Colors.white)),
              new Text("3. Ableitung: $dritteAbleitung", style: new TextStyle(color: Colors.white)),
            ]
          ),
        ),
        new Container(
          padding: new EdgeInsets.all(20.0),
          width: 500.0,
          color: Colors.green,
          child: new Column(
            children: [
              new Text("Nullstellen: $roots", style: new TextStyle(color: Colors.white)),
            ]
          ),
        ),
      ]
    );
  }
}



/*
 *
 ),
 */
