import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_app/core/usecases/usecase.dart';
import 'package:meal_app/features/meal/presenter/controllers/home_store.dart';
import 'package:meal_app/features/meal/presenter/pages/meal_page.dart';
import 'package:meal_app/features/meal/presenter/widgets/custom_app_bar.dart';
import 'package:meal_app/features/meal/presenter/widgets/round_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final noParams = NoParams();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Prato Aleatório'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Bem vindo ao prato aleatório!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0C120C),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Clique no botão abaixo para ver um prato novo e como fazê-lo.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0C120C),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                RoundButton(
                  label: "Clique aqui",
                  onTap: () async {
                    await store.getRandomMeal();
                    MealPage.navigate();
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
