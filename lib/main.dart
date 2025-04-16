import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ReceitasApp());
}

class ReceitasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Receitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(),
    );
  }
}
