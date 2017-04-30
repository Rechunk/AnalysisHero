import 'package:math_expressions/math_expressions.dart';

String addMultiplyOperatorInFrontOfX(String function){
  String newFunction = function;
  newFunction = function.replaceAllMapped(new RegExp(r'[0-9]x'), (match) {
    return '${newFunction.substring(match.start, match.end-1)}*x';
  });
  return newFunction;
}

double calculateResultOf(String function, int variableValue){
  Parser parser = new Parser();
  Variable variable = new Variable("x");
  Expression exp = parser.parse(addMultiplyOperatorInFrontOfX(function));

  ContextModel model = new ContextModel();
  model.bindVariable(variable, new Number(variableValue));
  return exp.evaluate(EvaluationType.REAL, model);
}


List<int> calculateRoots(String function){

  double eval = 0.0;
  List<int> roots = [];

  for (int i = -10; i < 10; i += 1){
    eval = calculateResultOf(function, i);
    if (eval == 0.0){
      roots.add(i);
    }
  }

  return roots;
}
