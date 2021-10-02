import 'package:faker/faker.dart';
import 'package:meal_app/features/meal/domain/entities/meal_entity.dart';

final tMeal = MealEntity(
    name: faker.lorem.word(),
    description: faker.lorem.sentence(),
    imageUrl: faker.lorem.sentence());
