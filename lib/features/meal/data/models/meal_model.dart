import 'package:meal_app/features/meal/domain/entities/meal_entity.dart';

class MealModel extends MealEntity {
  MealModel({
    required name,
    required description,
    required imageUrl,
  }) : super(
          name: name,
          description: description,
          imageUrl: imageUrl,
        );

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        name: json["meals"][0]["strMeal"],
        description: json["meals"][0]["strInstructions"],
        imageUrl: json["meals"][0]["strMealThumb"]
      );
}
