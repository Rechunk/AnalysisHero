import 'package:math_expressions/math_expressions.dart';

String makeFunction(String function){
  String newFunction = "";
  function = function.replaceAll(" ", "");
  function = function.replaceAll("x^0", "");
  List<String> elements = getTokensFromFunction(function);
  print(elements);

  RegExp factorRegex = new RegExp(r"-?[0-9\/.]*x");
  RegExp exponentRegex = new RegExp(r"\^-?[0-9\/.]*");

  for (int i = 0; i < elements.length; i++){
    if (xHasExponent(elements[i])){
      Match factorMatch = factorRegex.firstMatch(elements[i]);
      num factor = getFactorOfX(elements[i], factorMatch);
      Match exponentMatch = exponentRegex.firstMatch(elements[i]);
      num exponent = getExponentOfX(elements[i], exponentMatch);

      newFunction += "${factor*exponent}x^${exponent-1}";
    }
    else if (elementContainsX(elements[i])){
      Match match = factorRegex.firstMatch(elements[i]);
      newFunction += getFactorOfX(elements[i], match).toString();
    }
    else if (elementIsPlusOrMinus(elements[i])){
      try {
        if (elementContainsX(elements[i+1])){
          newFunction += elements[i];
        }
      }
      catch(ex) {}
    }

  }
  return newFunction;
}

List<String> simplifyAllFunctions(List<String> functions){
  for(int i = 0; i < functions.length; i++){
    functions[i] = simplifyFunction(functions[i]);
  }
  return functions;
}

String simplifyFunction(String function){
  if (function == ""){
    return "0";
  }

  function = function.replaceAll("x^0", "");
  function = function.replaceAll("x^1", "x");
  function = function.replaceAll("+", " + ");
  function = function.replaceAll("-", " - ");
  return function;
}

bool xHasExponent(String element){
  return (element.contains("^")) ? true : false;
}

bool elementIsPlusOrMinus(String element){
  return (element == "+" || element == "-") ? true : false;
}

bool elementContainsX(String element){
  return (element.contains("x")) ? true : false;
}

bool isFraction(String string){
  return (string.contains("/")) ? true : false;
}

num getFactorOfX(String element, var match){
  String factor = element.substring(match.start, match.end-1);
  if (isFraction(factor)){
    Parser parser = new Parser();
    Expression exp = parser.parse(factor);
    ContextModel model = new ContextModel();

    return (exp.evaluate(EvaluationType.REAL, model));
  }

  try{
    return num.parse(factor);
  }
  // If the user doesn't give a factor (e.g. x^3), then the factor is 1
  catch(ex){
    print(element.substring(match.start, match.end-1));
    return 1;
  }
}

num getExponentOfX(String element, var match){

  return num.parse(element.substring(match.start+1, match.end));
}

List<String> getTokensFromFunction(String function){

  List<String> splitList = [];
  Iterable<Match> matches = isolateSummandsAndOperators(function);
  matches.forEach((m)=>splitList.add(function.substring(m.start, m.end)));
  return splitList;
}

Iterable<Match> isolateSummandsAndOperators(String function){

  RegExp exp = new RegExp(r"(?:-?[0-9]*x[\^*/]\s*[\-+]|[^\-+])+|[\-+]");
  Iterable<Match> matches = exp.allMatches(function);
  return matches;
}
