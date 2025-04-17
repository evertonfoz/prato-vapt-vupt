import 'package:flutter/material.dart';

// Widget que define um menu lateral personalizado (Drawer)
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // O Drawer é um menu lateral que desliza da esquerda
      child: ListView(
        // ListView para organizar os itens do menu em uma lista
        children: [
          // Cabeçalho do menu
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green), // Fundo verde
            child: Text(
              'Menu', // Título do cabeçalho
              style: TextStyle(color: Colors.white, fontSize: 24), // Estilo do texto
            ),
          ),
          // Item do menu: Início
          ListTile(
            leading: Icon(Icons.home), // Ícone de casa
            title: Text('Início'), // Texto do item
            onTap: () => Navigator.pop(context), // Fecha o Drawer ao clicar
          ),
          // Item do menu: Sobre
          ListTile(
            leading: Icon(Icons.info), // Ícone de informação
            title: Text('Sobre'), // Texto do item
            onTap: () => Navigator.pop(context), // Fecha o Drawer ao clicar
          ),
        ],
      ),
    );
  }
}
