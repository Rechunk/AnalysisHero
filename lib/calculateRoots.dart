import 'package:math_expressions/math_expressions.dart';

String addMultiplyOperatorInFrontOfX(String function){
  String newFunction = function;
  newFunction = function.replaceAllMapped(new RegExp(r'[0-9]x'), (match) {
    return '${newFunction.substring(match.start, match.end-1)}*x';
  });
  return newFunction;
}

num calculateYOfX(String function, num variableValue){
  Parser parser = new Parser();
  Variable variable = new Variable("x");
  Expression exp = parser.parse(addMultiplyOperatorInFrontOfX(function));

  ContextModel model = new ContextModel();
  model.bindVariable(variable, new Number(variableValue));
  var result = exp.evaluate(EvaluationType.REAL, model);
  return result;
}

List<List<int>> getRootSpans(String function){
  List<List<int>> rootSpans = [];
  for (int x = -10; x < 10; x++){
    try{
      num current = calculateYOfX(function, x);
      num next = calculateYOfX(function, x+1);
      if (current < 0 && next >= 0){
        rootSpans.add([x, x+1]);
      }
      else if (current >= 0 && next < 0){
        rootSpans.add([x+1, x]);
      }
    }
    catch(ex) {}
  }
  return rootSpans;
}

bool onlyRootIsAtCenter(String function){
  RegExp exp = new RegExp(r"[0-9]*x\^2$");
  return (exp.hasMatch(function)) ? true : false;
}

List<num> calculateRoots(String function){

  List<num> roots = [];
  List<List<int>> rootSpans = getRootSpans(function);
  num result;
  num midValue;

  if (onlyRootIsAtCenter(function)){
    return [0.0];
  }

  for (int i = 0; i < rootSpans.length; i++){
    num leftToRoot = rootSpans[i][0];
    num rightToRoot = rootSpans[i][1];
    do {

      midValue = (leftToRoot + rightToRoot) / 2;
      result = calculateYOfX(function, midValue);

      if (result < 0){
        leftToRoot = midValue;
      }
      else {
        rightToRoot = midValue;
      }

    }
    while (leftToRoot.toStringAsFixed(2) != rightToRoot.toStringAsFixed(2));

    // Rounds to 3 digits of precision
    roots.add(num.parse(midValue.toStringAsFixed(3)));
  }
  return roots;
}
