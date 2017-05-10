import 'package:flutter/material.dart';

class HelpRoute<T> extends MaterialPageRoute<T> {
  HelpRoute({
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
        end: FractionalOffset.topLeft,
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

class DisplayHelpView extends StatelessWidget {

  Widget build(BuildContext context){

    return new Scaffold(
      appBar: new AppBar(title: new Text("Help", style: new TextStyle(fontFamily: "Raleway"))),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            padding: new EdgeInsets.all(40.0),
            child: new Text("Examples", style: new TextStyle(fontSize: 30.0, color: Colors.blue, fontFamily: "Raleway")),
          ),
          new Text("-- x^2 --", style: new TextStyle(fontSize: 17.5, color: Colors.blue, fontFamily: "Raleway")),
          new Text("-- x^3 --", style: new TextStyle(fontSize: 17.5, color: Colors.blue, fontFamily: "Raleway")),
          new Text("-- x^-3 --", style: new TextStyle(fontSize: 17.5, color: Colors.blue, fontFamily: "Raleway")),
          new Text("-- 5x^3 --", style: new TextStyle(fontSize: 17.5, color: Colors.blue, fontFamily: "Raleway")),
          new Text("-- 12x^-2 --", style: new TextStyle(fontSize: 17.5, color: Colors.blue, fontFamily: "Raleway")),
          new Text("-- x^2 + 4x --", style: new TextStyle(fontSize: 17.5, color: Colors.blue, fontFamily: "Raleway")),
          new Row(mainAxisAlignment: MainAxisAlignment.center)
        ]
      )
    );
  }
}
