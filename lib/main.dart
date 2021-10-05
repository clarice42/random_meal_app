import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_app/app_module.dart';
import 'package:meal_app/app_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModularApp(module: AppModule(), child: AppWidget());
  }
}
