import 'package:meal_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meal_app/core/usecases/usecase.dart';
import 'package:meal_app/features/meal/domain/entities/meal_entity.dart';
import 'package:meal_app/features/meal/domain/repositories/meal_repository.dart';

class GetRandomMealUsecase implements Usecase<MealEntity, NoParams> {
  final IMealRepository repository;

  GetRandomMealUsecase(this.repository);

  @override
  Future<Either<Failure, MealEntity>> call(NoParams params) async {
    return await repository.getRandomMeal();
  }
}
