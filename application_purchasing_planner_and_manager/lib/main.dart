import 'package:flutter/material.dart';
import 'package:application_purchasing_planner_and_manager/pages/inicio.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App de Notas',
      home: Inicio(),
    );
  }
}
