// Nome: Luciara Silva Pereira e Vivian Gomes Leal

import 'package:flutter/material.dart';
import 'screens/tela_inicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferências Musicais',
      home: TelaInicial(),
    );
  }
}