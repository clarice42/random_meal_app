import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/core/errors/failures.dart';
import 'package:meal_app/core/usecases/usecase.dart';
import 'package:meal_app/features/meal/domain/repositories/meal_repository.dart';
import 'package:meal_app/features/meal/domain/usecases/get_random_meal_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/meal_entity_mock.dart';

class MockMealRepository extends Mock implements IMealRepository {}

void main() {
  late GetRandomMealUsecase usecase;
  late IMealRepository repository;

  setUp(() {
    repository = MockMealRepository();
    usecase = GetRandomMealUsecase(repository);
  });

  final tNoParams = NoParams();

  final tFailure = ServerFailure();

  test("should get a random meal from the repository", () async {
    // Arrange
    when(() => repository.getRandomMeal())
        .thenAnswer((_) async => Right(tMeal));
    // Act
    final result = await usecase(tNoParams);
    // Assert
    expect(result, Right(tMeal));
    verify(() => repository.getRandomMeal());
  });

  test("should return a failure when don\'t succeed", () async {
    // Arrange
    when(() => repository.getRandomMeal())
        .thenAnswer((_) async => Left(tFailure));
    // Act
    final result = await usecase(tNoParams);
    // Assert
    expect(result, Left(tFailure));
    verify(() => repository.getRandomMeal());
  });
}
