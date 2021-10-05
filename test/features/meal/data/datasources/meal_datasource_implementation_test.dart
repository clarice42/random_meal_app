import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/core/errors/exceptions.dart';
import 'package:meal_app/features/meal/data/datasources/meal_datasource.dart';
import 'package:meal_app/features/meal/data/datasources/meal_datasource_implementation.dart';
import 'package:meal_app/features/meal/data/models/meal_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../mocks/meal_mock.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late IMealDatasource datasource;
  late http.Client client;

  setUp(() {
    client = MockClient();
    datasource = MealDatasourceImplementation(client: client);
    registerFallbackValue<Uri>(Uri());
  });

  final tMealModel = MealModel(
    name: "Christmas cake",
    description:
        "Heat oven to 160C\/fan 140C\/gas 3. Line the base and sides of a 20 cm round, 7.5 cm deep cake tin. Beat the butter and sugar with an electric hand mixer for 1-2 mins until very creamy and pale in colour, scraping down the sides of the bowl half way through. Stir in a spoonful of the flour, then stir in the beaten egg and the rest of the flour alternately, a quarter at a time, beating well each time with a wooden spoon. Stir in the almonds.\r\n\r\nMix in the sherry (the mix will look curdled), then add the peel, cherries, raisins, cherries, nuts, lemon zest, spice, rosewater and vanilla. Beat together to mix, then stir in the baking powder.\r\n\r\nSpoon mixture into the tin and smooth the top, making a slight dip in the centre. Bake for 30 mins, then lower temperature to 150C\/fan 130C\/gas 2 and bake a further 2-2\u00bc hrs, until a skewer insterted in the middle comes out clean. Leave to cool in the tin, then take out of the tin and peel off the lining paper. When completely cold, wrap well in cling film and foil to store until ready to decorate. The cake will keep for several months.",
    imageUrl:
        "https:\/\/www.themealdb.com\/images\/media\/meals\/ldnrm91576791881.jpg",
  );

  void successMock() {
    when(() => client.get(any()))
        .thenAnswer((_) async => http.Response(mealMock, 200));
  }

  test("should call the get method with correct url", () async {
    // Arrange
    successMock();
    // Act
    await datasource.getRandomMeal();
    // Assert
    verify(() => client.get(
            Uri.https("www.themealdb.com", "/api/json/v1/1/random.php", {})))
        .called(1);
  });

  test("should return a MealModel when is successful", () async {
    // Arrange
    successMock();
    // Act
    final result = await datasource.getRandomMeal();
    // Assert
    expect(result, tMealModel);
  });

  test("should throw a ServerException when the call is unsuccessful",
      () async {
    // Arrange
    when(() => client.get(any()))
        .thenAnswer((_) async => http.Response('something went wrong', 400));
    // Act
    final result = datasource.getRandomMeal();
    // Assert
    expect(() => result, throwsA(ServerException()));
  });
}
