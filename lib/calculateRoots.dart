import 'package:math_expressions/math_expressions.dart';

String addMultiplyOperatorInFrontOfX(String function){
  String newFunction = function;
  newFunction = function.replaceAllMapped(new RegExp(r'[0-9]x'), (match) {
    return '${newFunction.substring(match.start, match.end-1)}*x';
  });
  return newFunction;
}


List<int> calculateRoots(String function){
  Parser parser = new Parser();
  Expression exp = parser.parse(addMultiplyOperatorInFrontOfX(function));
  Variable x = new Variable("x");

  ContextModel model = new ContextModel();

  double eval = 0.0;
  List<int> roots = [];

  for (int i = -10; i < 10; i += 1){
    model.bindVariable(x, new Number(i));
    eval = exp.evaluate(EvaluationType.REAL, model);
    if (eval == 0.0){
      roots.add(i);
    }
  }

  return roots;
}
