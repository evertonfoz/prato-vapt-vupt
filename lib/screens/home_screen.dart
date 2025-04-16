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
  List<Recipe> receitasFavoritas = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final page = _pageController.page;
    if (page != null) {
      setState(() {
        _currentIndex = page.round();
      });
    }
  }

  void _embaralharReceitas() {
    setState(() {
      receitas.shuffle(Random());
    });
    _pageController.jumpToPage(0);
  }

  void _alternarFavorito(Recipe receita) {
    setState(() {
      receita.favorito = !receita.favorito;
      if (receita.favorito) {
        receitasFavoritas.add(receita);
      } else {
        receitasFavoritas.remove(receita);
      }
    });
  }

  void _filtrarPorCategoria(String categoria) {
    setState(() {
      categoriaAtual = categoria;
      if (categoria == 'Todas') {
        receitas = List.from(receitasData);
      } else if (categoria == 'Favoritas') {
        receitas = List.from(receitasFavoritas);
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
              leading: const Icon(Icons.favorite),
              title: const Text('Favoritas'),
              selected: categoriaAtual == 'Favoritas',
              onTap: () {
                Navigator.pop(context);
                _filtrarPorCategoria('Favoritas');
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
      body: categoriaAtual == 'Favoritas' && receitasFavoritas.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '❤️',
                    style: TextStyle(fontSize: 64),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nenhum favorito por enquanto,\nque tal adicionar o seu?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => _filtrarPorCategoria('Todas'),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Voltar para receitas'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: receitas.length,
              itemBuilder: (context, index) {
                final receita = receitas[index];
                return _buildReceitaCard(receita);
              },
            ),
      floatingActionButton: receitas.isEmpty
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: () => _alternarFavorito(receitas[_currentIndex]),
              child: Icon(
                receitas[_currentIndex].favorito
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
    );
  }

  Widget _buildReceitaCard(Recipe receita) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  receita.titulo,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(
                  receita.favorito ? Icons.favorite : Icons.favorite_border,
                  color: receita.favorito ? Colors.red : null,
                ),
                onPressed: () => _alternarFavorito(receita),
              ),
            ],
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
