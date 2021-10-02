import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/core/errors/exceptions.dart';
import 'package:meal_app/core/errors/failures.dart';
import 'package:meal_app/features/meal/data/datasources/meal_datasource.dart';
import 'package:meal_app/features/meal/data/models/meal_model.dart';
import 'package:meal_app/features/meal/data/repositories/meal_repository_implementation.dart';
import 'package:mocktail/mocktail.dart';

class MockMealDatasource extends Mock implements IMealDatasource {}

void main() {
  late MealRepositoryImplementation repository;
  late IMealDatasource datasource;

  setUp(() {
    datasource = MockMealDatasource();
    repository = MealRepositoryImplementation(datasource);
  });

  final tMealModel = MealModel(
    name: faker.lorem.word(),
    description: faker.lorem.sentence(),
    imageUrl: faker.lorem.sentence(),
  );

  test("should return meal model when calls the datasource", () async {
    // Arrange
    when(() => datasource.getRandomMeal()).thenAnswer((_) async => tMealModel);
    // Act
    final result = await repository.getRandomMeal();
    // Assert
    expect(result, Right(tMealModel));
    verify(() => datasource.getRandomMeal());
  });

  test(
      "should return a server failure when the call to datasource is unsuccessfull",
      () async {
    // Arrange
    when(() => datasource.getRandomMeal()).thenThrow(ServerException());
    // Act
    final result = await repository.getRandomMeal();
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getRandomMeal());
  });
}
