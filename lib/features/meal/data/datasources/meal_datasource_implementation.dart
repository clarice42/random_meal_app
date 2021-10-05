import 'dart:convert';

import 'package:meal_app/core/errors/exceptions.dart';
import 'package:meal_app/features/meal/data/datasources/endpoints/meal_endpoints.dart';
import 'package:meal_app/features/meal/data/datasources/meal_datasource.dart';
import 'package:meal_app/features/meal/data/models/meal_model.dart';
import 'package:http/http.dart' as http;

class MealDatasourceImplementation implements IMealDatasource {
  final http.Client client;

  MealDatasourceImplementation({required this.client});

  @override
  Future<MealModel> getRandomMeal() async {
    final response = await client.get(MealEndpoints.getRandomMeal());
    if (response.statusCode == 200) {
      return MealModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
