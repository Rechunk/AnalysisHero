import 'package:flutter/material.dart';
import "resultsPage.dart";
import "main.dart";
import "calculateDerivations.dart";

void populateDerivations(){
  function = controller.text;
  derivations[0] = makeFunction(function);
  derivations[1] = makeFunction(derivations[0]);
  derivations[2] = makeFunction(derivations[1]);

  derivations = simplifyAllFunctions(derivations);
}

void navigateToResults(BuildContext context){
  Navigator.push(context, new ResultsRoute(
    builder: (_) => new DisplayResultsView()
  ));
}
