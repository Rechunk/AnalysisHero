import "calculateRoots.dart";

bool isMinimum(num pointBefore, num pointAfter){
  return (pointBefore < 0 && pointAfter > 0) ? true : false;
}

bool isMaximum(num pointBefore, num pointAfter){
  return (pointBefore > 0 && pointAfter < 0) ? true : false;
}

List<List<List<num>>> calculateExtremes(String function, String firstDerivation){

  List<List<num>> minimums = [];
  List<List<num>> maximums = [];
  List<List<num>> turningPoints = [];
  firstDerivation = firstDerivation.replaceAll(" ", "");
  List<num> roots = calculateRoots(firstDerivation);

  for (int x = 0; x < roots.length; x++){
    num pointBefore = calculateYOfX(firstDerivation, x-1);
    num pointAfter = calculateYOfX(firstDerivation, x+1);

    if (isMinimum(pointBefore, pointAfter)){
      minimums.add([x, calculateYOfX(function, x.toDouble())]);
    }
    else if (isMaximum(pointBefore, pointAfter)){
      maximums.add([x, calculateYOfX(function, x.toDouble())]);
    }
    else {
      turningPoints.add([x, calculateYOfX(function, x.toDouble())]);
    }
  }
  return [[minimums], [maximums], [turningPoints]];
}
