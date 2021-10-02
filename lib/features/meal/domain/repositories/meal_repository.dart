import 'package:dartz/dartz.dart';
import 'package:meal_app/core/errors/failures.dart';
import 'package:meal_app/features/meal/domain/entities/meal_entity.dart';

abstract class IMealRepository {
  Future<Either<Failure, MealEntity>> getRandomMeal();
}
