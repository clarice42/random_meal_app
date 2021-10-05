import 'package:flutter_triple/flutter_triple.dart';
import 'package:meal_app/core/errors/failures.dart';
import 'package:meal_app/features/meal/domain/entities/meal_entity.dart';
import 'package:meal_app/features/meal/domain/usecases/get_random_meal_usecase.dart';

class HomeStore extends NotifierStore<Failure, MealEntity> {
  final GetRandomMealUsecase usecase;

  HomeStore(this.usecase)
      : super(MealEntity(
          name: "",
          description: "",
          imageUrl: "",
        ));

  getRandomMeal() async {
    setLoading(true);
    final result = await usecase();
    result.fold((error) => setError(error), (success) => update(success));
    setLoading(false);
  }
}
