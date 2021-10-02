import 'package:meal_app/features/meal/data/models/meal_model.dart';

abstract class IMealDatasource {
  Future<MealModel> getRandomMeal();
}
