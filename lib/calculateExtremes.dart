import "calculateRoots.dart";

List<List<List<num>>> calculateExtremes(String function, String firstDerivation){

  List<List<num>> minimums = [];
  List<List<num>> maximums = [];
  List<List<num>> turningPoints = [];
  List<num> roots = calculateRoots(firstDerivation);

  print("The roots of the derivation are $roots");
  for (int x = 0; x < roots.length; x++){
    num yBeforeRoot = calculateYOfX(firstDerivation, x-1);
    num yAfterRoot = calculateYOfX(firstDerivation, x+1);

    print("$yBeforeRoot, $yAfterRoot");
    if (yBeforeRoot < 0 && yAfterRoot > 0){ // minus to plus = minimum
      minimums.add([x, calculateYOfX(function, x.toDouble())]);
    }
    else if (yBeforeRoot > 0 && yAfterRoot < 0){
      maximums.add([x, calculateYOfX(function, x.toDouble())]);
    }
    else {
      turningPoints.add([x, calculateYOfX(function, x.toDouble())]);
    }
  }
  return [[minimums], [maximums], [turningPoints]];
}
