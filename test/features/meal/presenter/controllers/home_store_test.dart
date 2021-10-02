import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/core/errors/failures.dart';
import 'package:meal_app/core/usecases/usecase.dart';
import 'package:meal_app/features/meal/domain/usecases/get_random_meal_usecase.dart';
import 'package:meal_app/features/meal/presenter/controllers/home_store.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/meal_entity_mock.dart';

class MockGetRandomMealUsecase extends Mock implements GetRandomMealUsecase {}

void main() {
  late HomeStore store;
  late GetRandomMealUsecase mockUsecase;

  final tNoParams = NoParams();

  setUp(() {
    mockUsecase = MockGetRandomMealUsecase();
    store = HomeStore(mockUsecase);
    registerFallbackValue(tNoParams);
  });

  test("should return a Meal from the usecase", () async {
    // Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => Right(tMeal));
    // Act
    await store.getRandomMeal(tNoParams);
    // Assert
    store.observer(onState: (state) {
      expect(state, tMeal);
      verify(() => mockUsecase(tNoParams)).called(1);
    });
  });

  final tFailure = ServerFailure();

  test("should return a failure from the usecase when there is an error",
      () async {
    // Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => Left(tFailure));
    // Act
    await store.getRandomMeal(tNoParams);
    // Assert
    store.observer(onError: (error) {
      expect(error, tFailure);
      verify(() => mockUsecase(tNoParams)).called(1);
    });
  });
}
