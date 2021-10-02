import 'package:meal_app/features/meal/data/datasources/meal_datasource.dart';
import 'package:meal_app/features/meal/domain/entities/meal_entity.dart';
import 'package:meal_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meal_app/features/meal/domain/repositories/meal_repository.dart';

class MealRepositoryImplementation implements IMealRepository {
  final IMealDatasource datasource;

  MealRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, MealEntity>> getRandomMeal() async {
    try {
      final result = await datasource.getRandomMeal();
      return Right(result);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
