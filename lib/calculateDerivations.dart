String makeFunction(String function){
  String newFunction = "";
  function = function.replaceAll(" ", "");
  function = function.replaceAll("x^0", "");
  List<String> elements = isolateSummandsByOperators(function);

  RegExp factorRegex = new RegExp(r"-?[0-9]*x");
  RegExp exponentRegex = new RegExp(r"\^-?[0-9]*");

  for (int i = 0; i < elements.length; i++){
    if (xHasExponent(elements[i])){
      Match factorMatch = factorRegex.firstMatch(elements[i]);
      int factor = getFactorOfX(elements[i], factorMatch);
      Match exponentMatch = exponentRegex.firstMatch(elements[i]);
      int exponent = getExponentOfX(elements[i], exponentMatch);

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

String simplifyFunction(String function){
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

int getFactorOfX(String element, var match){
  return int.parse(element.substring(match.start, match.end-1));
}

int getExponentOfX(String element, var match){
  return int.parse(element.substring(match.start+1, match.end));
}

List<String> isolateSummandsByOperators(String function){
  List<String> splitList = [];

  RegExp exp = new RegExp(r"(?:-?[0-9]*x[\^*/]\s*[\-+]|[^\-+])+|[\-+]");
  Iterable<Match> matches = exp.allMatches(function);
  matches.forEach((m)=>splitList.add(function.substring(m.start, m.end)));

  return splitList;
}
