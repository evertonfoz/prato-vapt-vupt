import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Função principal que inicia o aplicativo
void main() {
  runApp(ReceitasApp()); // Executa o widget raiz do aplicativo
}

// Widget raiz do aplicativo
class ReceitasApp extends StatelessWidget {
  const ReceitasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título do aplicativo
      title: 'App de Receitas',

      // Remove a faixa de debug no canto superior direito
      debugShowCheckedModeBanner: false,

      // Define o tema do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.green, // Cor primária do tema
        fontFamily: 'Roboto',        // Fonte padrão do aplicativo
      ),

      // Define a tela inicial do aplicativo
      home: HomeScreen(), // Carrega a tela inicial (HomeScreen)
    );
  }
}
