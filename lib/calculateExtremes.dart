import "calculateRoots.dart";

List<double> calculateExtremes(String function, String firstDerivation){
  List<double> extremes = [];

  List<int> roots = calculateRoots(firstDerivation);

  for (int i = 0; i < roots.length; i++){
    extremes.add(calculateResultOf(firstDerivation, i));
  }

  return extremes;
}
