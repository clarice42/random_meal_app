import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:meal_app/core/usecases/usecase.dart';
import 'package:meal_app/features/meal/domain/entities/meal_entity.dart';
import 'package:meal_app/features/meal/presenter/controllers/home_store.dart';
import 'package:meal_app/features/meal/presenter/widgets/description_bottom_sheet.dart';
import 'package:meal_app/features/meal/presenter/widgets/image_network_with_loader.dart';
import 'package:meal_app/features/meal/presenter/widgets/page_slider_up.dart';

class MealPage extends StatefulWidget {
  static void navigate() {
    Modular.to.pushNamed(
      '/meal',
    );
  }

  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends ModularState<MealPage, HomeStore> {
  final noParams = NoParams();

  @override
  void initState() {
    super.initState();
    store.getRandomMeal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScopedBuilder(
        store: store,
        onLoading: (context) => Center(child: CircularProgressIndicator()),
        onError: (context, error) => Center(
          child: Text(
            'An error occurred, try again later.',
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.white),
          ),
        ),
        onState: (context, MealEntity meal) {
          return PageSliderUp(
            onSlideUp: () => showDescriptionBottomSheet(
              context: context,
              title: meal.name,
              description: meal.description,
            ),
            child: ImageNetworkWithLoader(meal.imageUrl),
          );
        },
      ),
    );
  }
}
