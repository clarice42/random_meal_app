class MealEndpoints {
  static Uri getRandomMeal() =>
      Uri.https("www.themealdb.com", "/api/json/v1/1/random.php", {});
}
