import 'package:flutter/material.dart';
import "calculateDerivations.dart";
import "calculateRoots.dart";

InputValue val = new InputValue(text: "");
String ersteAbleitung = "";
String zweiteAbleitung = "";
String dritteAbleitung = "";
String roots = "";
String function = "";

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

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text(config.title)),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new InputWidget(),
        ]
      ),
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({
    WidgetBuilder builder,
  }): super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new SlideTransition(
      position: new FractionalOffsetTween(
        begin: FractionalOffset.topRight,
        end: FractionalOffset.topLeft
      )
      .animate(
        new CurvedAnimation(
          parent: animation,
          curve: Curves.decelerate,
        )
      ),
      child: child,
    );
    //return new FadeTransition(opacity: animation, child: child);
  }

  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class InputWidget extends StatefulWidget {
  @override
  InputWidgetState createState() => new InputWidgetState();
}

class InputWidgetState extends State<InputWidget> {

  @override
  Widget build(BuildContext context) {

    return new Column(
        children: [
          new Text("Funktion hier eingeben:", style: new TextStyle(fontSize: 20.0, color: Colors.black)),
          new TextField(
            style: new TextStyle(fontSize: 20.0, color: Colors.black),
            onChanged: (InputValue newInputValue) {
              setState(() {
                val = newInputValue;
            });
          }),
          new IconButton(
            icon: new Icon(Icons.check),
            onPressed: () {
              function = val.text;
              ersteAbleitung = makeFunction(function);
              zweiteAbleitung = makeFunction(ersteAbleitung);
              dritteAbleitung = makeFunction(zweiteAbleitung);

              ersteAbleitung = simplifyFunction(ersteAbleitung);
              zweiteAbleitung = simplifyFunction(zweiteAbleitung);
              dritteAbleitung = simplifyFunction(dritteAbleitung);

              roots = calculateRoots(function).toString();

              Navigator.push(context, new MyCustomRoute(
                builder: (_) => new MyCustomView()
              ));
            },
          )
        ]
    );
  }
}

class MyCustomView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text("Ergebnisse")),
      body: new ListView(
        children: [
          new Container(
            width: 500.0,
            padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            color: new Color.fromARGB(255, 53, 126, 92),
            child: new Column(
              children: [
                new Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: new Text("Ableitungen", style: new TextStyle(fontSize: 30.0, fontFamily: "Barrio", color: new Color.fromARGB(255, 230, 230, 230))),
                ),
                new Text("1. Ableitung: $ersteAbleitung", style: new TextStyle(fontSize: 17.5, color: new Color.fromARGB(255, 230, 230, 230))),
                new Text("2. Ableitung: $zweiteAbleitung", style: new TextStyle(fontSize: 17.5, color: new Color.fromARGB(255, 230, 230, 230))),
                new Text("3. Ableitung: $dritteAbleitung", style: new TextStyle(fontSize: 17.5, color: new Color.fromARGB(255, 230, 230, 230))),
              ]
            ),
          ),
          new Container(
            width: 500.0,
            padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            color: new Color.fromARGB(255, 13, 50, 76),
            child: new Column(
              children: [
                new Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: new Text("Nullstellen", style: new TextStyle(fontSize: 30.0, fontFamily: "Barrio", color: new Color.fromARGB(255, 230, 230, 230))),
                ),
                new Text(roots, style: new TextStyle(fontSize: 17.5, color: new Color.fromARGB(255, 230, 230, 230))),
              ]
            ),
          ),
        ]
      ),
    );
  }
}



/*
 *
 ),
 */

/*
 * function = val.text;
 ersteAbleitung = makeFunction(function);
 zweiteAbleitung = makeFunction(ersteAbleitung);
 dritteAbleitung = makeFunction(zweiteAbleitung);

 ersteAbleitung = simplifyFunction(ersteAbleitung);
 zweiteAbleitung = simplifyFunction(zweiteAbleitung);
 dritteAbleitung = simplifyFunction(dritteAbleitung);

 List<int> calculatedRoots = calculateRoots(function);

 roots = calculatedRoots.toString();
 */
