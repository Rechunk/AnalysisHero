import "main.dart";
import "calculateDerivations.dart";

void populateDerivations(){
  function = controller.text;
  derivations[0] = makeFunction(function);
  derivations[1] = makeFunction(derivations[0]);
  derivations[2] = makeFunction(derivations[1]);

  derivations = simplifyAllFunctions(derivations);
}
