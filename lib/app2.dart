import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necesario para el Clipboard
import 'package:generador_de_contrasenias/widgets/Texto.dart';
import 'package:generador_de_contrasenias/widgets/FormsFields.dart';
import 'package:generador_de_contrasenias/widgets/checkbox.dart';

class PasswordGeneratorWidget extends StatefulWidget {
  @override
  _PasswordGeneratorWidgetState createState() =>
      _PasswordGeneratorWidgetState();
}

class _PasswordGeneratorWidgetState extends State<PasswordGeneratorWidget> {
  TextEditingController _sizeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isEasyToSay = false;
  bool _isEasyToRead = false;
  bool _hasAllCharacters = false;
  bool _hasUpperCase = false;
  bool _hasLowerCase = false;
  bool _hasNumbers = false;
  bool _hasSymbols = false;

  String generatePassword() {
    String chars = '';
    if (_hasUpperCase) chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (_hasLowerCase) chars += 'abcdefghijklmnopqrstuvwxyz';
    if (_hasNumbers) chars += '0123456789';
    if (_hasSymbols) chars += '!@#\$%^&*()_+{}|:<>?';

    String password = '';
    int size = int.tryParse(_sizeController.text) ?? 8;
    for (int i = 0; i < size; i++) {
      password += chars[Random().nextInt(chars.length)];
    }
    return password;
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Contraseña copiada al portapapeles')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _passwordController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Contraseña generada',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {
                    copyToClipboard(_passwordController.text);
                  },
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
                Text(
                  "Personalice su contraseña",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Divider(thickness: 2),
                TextField(
                  controller: _sizeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "Ingrese el tamaño de su contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RoundedCheckboxWithText(
                          text: 'Facil de decir',
                          initialValue: false,
                          onChanged: (value) {
                            setState(() {
                              _isEasyToSay = value;
                            });
                          },
                        ),
                        RoundedCheckboxWithText(
                          text: 'Facil de leer',
                          initialValue: false,
                          onChanged: (value) {
                            setState(() {
                              _isEasyToRead = value;
                              if (value) {
                                _hasNumbers = false;
                                _hasSymbols = false;
                              }
                            });
                          },
                        ),
                        RoundedCheckboxWithText(
                          text: 'Todos los caracteres',
                          initialValue: false,
                          onChanged: (value) {
                            setState(() {
                              _hasAllCharacters = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RoundedCheckboxWithText(
                          text: 'Mayusculas',
                          initialValue: false,
                          onChanged: (value) {
                            setState(() {
                              _hasUpperCase = value;
                            });
                          },
                        ),
                        RoundedCheckboxWithText(
                          text: 'Minúsculas',
                          initialValue: false,
                          onChanged: (value) {
                            setState(() {
                              _hasLowerCase = value;
                            });
                          },
                        ),
                        RoundedCheckboxWithText(
                          text: 'Números',
                          initialValue: false,
                          onChanged: (value) {
                            setState(() {
                              _hasNumbers = value && !_isEasyToRead;
                            });
                          },
                          enabled: !_isEasyToRead,
                        ),
                        RoundedCheckboxWithText(
                          text: 'Símbolos',
                          initialValue: false,
                          onChanged: (value) {
                            setState(() {
                              _hasSymbols = value && !_isEasyToRead;
                            });
                          },
                          enabled: !_isEasyToRead,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _passwordController.text = generatePassword();
                    });
                  },
                  child: Text('Generar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




