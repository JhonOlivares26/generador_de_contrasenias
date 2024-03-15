import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necesario para el Clipboard
import 'package:generador_de_contrasenias/widgets/Texto.dart';
import 'package:generador_de_contrasenias/widgets/FormsFields.dart';
import 'package:generador_de_contrasenias/widgets/checkbox.dart';

Widget app() {
  TextEditingController miController = TextEditingController();

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: miController,
                decoration: InputDecoration(
                  hintText: 'Contraseña generada',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 16),
      Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Textoo("Personalice su contraseña"),
            Divider(thickness: 2),
            CustomTextField(controller: miController, hintText: "Ingrese el tamaño de su contraseña",), 

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedCheckboxWithText(text: 'Facil de decir', initialValue: false, onChanged: (value) {},),
                    RoundedCheckboxWithText(text: 'Facil de leer', initialValue: false, onChanged: (value) {},),
                    RoundedCheckboxWithText(text: 'Todos los caracteres', initialValue: false, onChanged: (value) {},),
                    SizedBox(height: 20), // Agrega un Spacer
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedCheckboxWithText(text: 'Mayusculas', initialValue: false, onChanged: (value) {},),
                    RoundedCheckboxWithText(text: 'Minúsculas', initialValue: false, onChanged: (value) {},),
                    RoundedCheckboxWithText(text: 'Números', initialValue: false, onChanged: (value) {},),
                    RoundedCheckboxWithText(text: 'Símbolos', initialValue: false, onChanged: (value) {},),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    ],
  );
}








