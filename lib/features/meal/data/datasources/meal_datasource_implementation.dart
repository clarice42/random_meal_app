import 'dart:convert';

import 'package:meal_app/core/dio_client/dio_client.dart';
import 'package:meal_app/core/errors/exceptions.dart';
import 'package:meal_app/features/meal/data/datasources/endpoints/meal_endpoints.dart';
import 'package:meal_app/features/meal/data/datasources/meal_datasource.dart';
import 'package:meal_app/features/meal/data/models/meal_model.dart';

class MealDatasourceImplementation implements IMealDatasource {
  final DioClient client;

  MealDatasourceImplementation(this.client);

  @override
  Future<MealModel> getRandomMeal() async {
    final response = await client.get(MealEndpoints.randomMeal());
    if (response.statusCode == 200) {
      return MealModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
