import 'package:flutter/material.dart';
import 'package:generador_de_contrasenias/app.dart';
import 'package:generador_de_contrasenias/app2.dart';
import 'package:generador_de_contrasenias/widgets/Texto.dart';
import 'package:generador_de_contrasenias/widgets/FormsFields.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: PasswordGeneratorWidget()
          
        ),
      ),
    );
  }
}
