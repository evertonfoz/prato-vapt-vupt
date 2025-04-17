import 'package:flutter/material.dart';

// Widget que representa um card de receita
class RecipeCard extends StatelessWidget {
  // Propriedades do card: título e caminho da imagem
  final String title;
  final String imagePath;

  // Construtor do RecipeCard, com parâmetros obrigatórios
  const RecipeCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card com elevação para criar um efeito de sombra
      elevation: 4,
      // Margem inferior para espaçamento entre os cards
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        // Organiza os elementos do card verticalmente
        children: [
          // Exibe a imagem da receita
          Image.asset(imagePath),
          // Espaçamento interno e título da receita
          Padding(
            padding: const EdgeInsets.all(16), // Espaçamento interno
            child: Text(
              title, // Título da receita
              style: TextStyle(
                fontSize: 20, // Tamanho da fonte
                fontWeight: FontWeight.bold, // Negrito
              ),
            ),
          )
        ],
      ),
    );
  }
}
