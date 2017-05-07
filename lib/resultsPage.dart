import 'package:flutter/material.dart';
import "main.dart";
import "drawGraph.dart";

class ResultsRoute<T> extends MaterialPageRoute<T> {
  ResultsRoute({
    WidgetBuilder builder,
  }): super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child)
  {
    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      position: new FractionalOffsetTween(
        begin: FractionalOffset.topRight,
        end: FractionalOffset.topLeft
      )
      .animate(
        new CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        )
      ),
      child: child,
    );
  }

  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class DisplayResultsView extends StatelessWidget {

  TextStyle textStyle = new TextStyle(fontSize: 17.5, fontFamily: "Raleway", color: new Color.fromARGB(255, 230, 230, 230));

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text("Ergebnisse", style: new TextStyle(fontFamily: "Raleway"))),
      body: new ListView(
        children: [
          new Container(
            width: 500.0,
            height: 250.0,
            padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            color: new Color(0xFFE8823D),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: new Text("Ableitungen", style: new TextStyle(fontSize: 30.0, fontFamily: "Barrio", color: new Color.fromARGB(255, 230, 230, 230))),
                ),
                new Text("f'(x) = ${derivations[0]}", style: textStyle),
                new Text("f''(x) = ${derivations[1]}", style: textStyle),
                new Text("f'''(x) = ${derivations[2]}", style: textStyle),
              ]
            ),
          ),
          new Container(
            width: 500.0,
            height: 250.0,
            padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            decoration: new BoxDecoration(
              color: const Color(0xFF343F7F),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: new Text("Nullstellen", style: new TextStyle(fontSize: 30.0, fontFamily: "Barrio", color: new Color.fromARGB(255, 230, 230, 230))),
                ),
                new Text(roots, style: textStyle),
              ]
            ),
          ),
          new Container(
            width: 500.0,
            height: 250.0,
            padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            decoration: new BoxDecoration(
              color: const Color(0xFFB23D14),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: new Text("Extremstellen", style: new TextStyle(fontSize: 30.0, fontFamily: "Barrio", color: new Color.fromARGB(255, 230, 230, 230))),
                ),
                new Text("Minima: ${extremes[0][0].toString()}" , style: textStyle),
                new Text("Maxima: ${extremes[1][0].toString()}" , style: textStyle),
                new Text("Wendepunkte: ${extremes[2][0].toString()}" , style: textStyle),
              ]
            ),
          ),
          new Container(
            width: 500.0,
            height: 300.0,
            padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            color: const Color(0xFF116C98),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                ),
                new CustomPaint(
                  size: new Size(100.0, 180.0),
                  painter: new BarChartPainter(0.0),
                ),
              ]
            ),
          ),
        ]
      ),
    );
  }
}
