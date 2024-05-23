import 'package:cookbook/models/ingredient.dart';

class Helper {
  static List<ExtendedIngredient> getExtendedIngredient(
    List<dynamic>? items,
  ) {
    List<ExtendedIngredient> extendedIngredient = [];

    if (items != null) {
      for (var item in items) {
        extendedIngredient.add(ExtendedIngredient.fromJson(item));
      }
    }

    return extendedIngredient;
  }
}
