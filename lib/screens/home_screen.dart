import 'dart:math';
import 'package:flutter/material.dart';
import '../data/recipe_data.dart';
import '../models/recipe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  List<Recipe> receitas = List.from(receitasData);
  String categoriaAtual = 'Todas';

  void _embaralharReceitas() {
    setState(() {
      receitas.shuffle(Random());
    });
    _pageController.jumpToPage(0);
  }

  void _filtrarPorCategoria(String categoria) {
    setState(() {
      categoriaAtual = categoria;
      if (categoria == 'Todas') {
        receitas = List.from(receitasData);
      } else {
        receitas = receitasData.where((receita) {
          switch (categoria) {
            case 'Doces':
              return ['Bolo de Cenoura', 'Panqueca de Banana', 'Brigadeiro']
                  .contains(receita.titulo);
            case 'Salgados':
              return [
                'Lasanha à Bolonhesa',
                'Feijoada',
                'Moqueca Baiana',
                'Frango Xadrez',
                'Escondidinho de Carne',
                'Risoto de Camarão'
              ].contains(receita.titulo);
            case 'Lanches':
              return ['Pizza Caseira', 'Tacos Mexicanos', 'Coxinha']
                  .contains(receita.titulo);
            default:
              return false;
          }
        }).toList();
      }
    });
    _pageController.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prato Vapt Vupt'),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(Icons.restart_alt),
            onPressed: _embaralharReceitas,
          ),
          SizedBox(width: 16),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.restaurant_menu, size: 48, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Todas as Receitas'),
              selected: categoriaAtual == 'Todas',
              onTap: () {
                Navigator.pop(context);
                _filtrarPorCategoria('Todas');
              },
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Categorias',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text('Doces'),
              selected: categoriaAtual == 'Doces',
              onTap: () {
                Navigator.pop(context);
                _filtrarPorCategoria('Doces');
              },
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Salgados'),
              selected: categoriaAtual == 'Salgados',
              onTap: () {
                Navigator.pop(context);
                _filtrarPorCategoria('Salgados');
              },
            ),
            ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text('Lanches'),
              selected: categoriaAtual == 'Lanches',
              onTap: () {
                Navigator.pop(context);
                _filtrarPorCategoria('Lanches');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Favoritas'),
              onTap: () {
                Navigator.pop(context);
                // lógica futura: exibir favoritas
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Sobre o App'),
              onTap: () {
                Navigator.pop(context);
                showAboutDialog(
                  context: context,
                  applicationName: 'Receitas TikTok',
                  applicationVersion: '1.0',
                  children: [
                    const Text('Aplicativo feito com Flutter.'),
                    const Text('Inspirado no estilo TikTok.'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: receitas.length,
        itemBuilder: (context, index) {
          final receita = receitas[index];
          return _buildReceitaCard(receita);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: _embaralharReceitas,
        child: const Icon(Icons.shuffle),
      ),
    );
  }

  Widget _buildReceitaCard(Recipe receita) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            receita.titulo,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              receita.imagem,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            receita.descricao,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text('Autor: ${receita.autor}'),
          Text('Tempo: ${receita.tempoPreparo}'),
          Text('Porções: ${receita.porcoes}'),
          const Divider(height: 30),
          const Text(
            'Ingredientes:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...receita.ingredientes.map((item) => Text('- $item')),
          const Divider(height: 30),
          const Text(
            'Modo de Preparo:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...receita.modoPreparo.asMap().entries.map(
                (e) => Text('${e.key + 1}. ${e.value}'),
          ),
        ],
      ),
    );
  }
}
