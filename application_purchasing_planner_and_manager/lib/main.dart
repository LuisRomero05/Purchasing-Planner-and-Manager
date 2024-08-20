import 'package:flutter/material.dart';
import 'package:application_purchasing_planner_and_manager/pages/inicio.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegúrate de inicializar WidgetsFlutterBinding
  await Firebase.initializeApp(); // Inicializa Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App de Notas',
      home: Inicio(),
    );
  }
}
