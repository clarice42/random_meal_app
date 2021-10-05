import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_app/features/meal/domain/usecases/get_random_meal_usecase.dart';
import 'package:meal_app/features/meal/presenter/controllers/home_store.dart';
import 'package:meal_app/features/meal/presenter/pages/meal_page.dart';
import 'features/meal/data/datasources/meal_datasource_implementation.dart';
import 'features/meal/data/repositories/meal_repository_implementation.dart';
import 'features/meal/presenter/pages/home_page.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => HomeStore(i())),
    Bind.lazySingleton((i) => GetRandomMealUsecase(i())),
    Bind.lazySingleton((i) => MealRepositoryImplementation(i())),
    Bind.lazySingleton((i) => http.Client()),
    Bind.lazySingleton((i) => MealDatasourceImplementation(client: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, __) => HomePage()),
    ChildRoute("/meal", child: (_, __) => MealPage()),
  ];
}
