import 'dart:math';
import 'package:flutter/material.dart';
import '../data/recipe_data.dart';
import '../models/recipe.dart';

// Classe principal da tela inicial do aplicativo
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controlador para o PageView (navegação vertical entre receitas)
  final PageController _pageController = PageController();

  // Lista de receitas carregadas inicialmente a partir de receitasData
  List<Recipe> receitas = List.from(receitasData);

  // Categoria atualmente selecionada no filtro
  String categoriaAtual = 'Todas';

  // Lista de receitas marcadas como favoritas
  List<Recipe> receitasFavoritas = [];

  // Índice atual da página no PageView
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Adiciona um listener para monitorar mudanças de página no PageView
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    // Remove o listener e libera o controlador ao descartar a tela
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  // Atualiza o índice da página atual ao mudar de página no PageView
  void _onPageChanged() {
    final page = _pageController.page;
    if (page != null) {
      setState(() {
        _currentIndex = page.round();
      });
    }
  }

  // Embaralha a lista de receitas e volta para a primeira página
  void _embaralharReceitas() {
    setState(() {
      receitas.shuffle(Random());
    });
    _pageController.jumpToPage(0);
  }

  // Alterna o estado de favorito de uma receita
  void _alternarFavorito(Recipe receita) {
    setState(() {
      receita.favorito = !receita.favorito;

      if (receita.favorito) {
        // Adiciona à lista de favoritos se foi marcado
        if (!receitasFavoritas.contains(receita)) {
          receitasFavoritas.add(receita);
        }
      } else {
        // Remove da lista de favoritos
        receitasFavoritas.remove(receita);

        // Se estiver na aba Favoritas, também precisa atualizar a lista visível
        if (categoriaAtual == 'Favoritas') {
          receitas.remove(receita);

          // Ajusta o índice para mostrar a próxima receita
          if (receitas.isNotEmpty) {
            // Se o índice atual ficou fora do alcance, volta pro anterior
            if (_currentIndex >= receitas.length) {
              _currentIndex = receitas.length - 1;
            }

            // Muda para a nova receita visível
            _pageController.jumpToPage(_currentIndex);
          } else {
            // Lista vazia: força reconstrução para mostrar a tela "nenhum favorito"
            _currentIndex = 0;
          }
        }
      }
    });
  }

  // Filtra as receitas com base na categoria selecionada
  void _filtrarPorCategoria(String categoria) {
    setState(() {
      categoriaAtual = categoria;
      if (categoria == 'Todas') {
        // Mostra todas as receitas
        receitas = List.from(receitasData);
      } else if (categoria == 'Favoritas') {
        // Mostra apenas as receitas favoritas
        receitas = List.from(receitasFavoritas);
      } else {
        // Filtra receitas por categorias específicas
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
    _pageController.jumpToPage(0); // Volta para a primeira página
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: const Text(
          'Prato Vapt Vupt',
          style: TextStyle(
            fontFamily: 'CreamCake', // Fonte personalizada
            fontSize: 30,           // Tamanho da fonte
            fontWeight: FontWeight.bold, // Peso da fonte
          ),
        ),
        backgroundColor: Colors.deepOrange, // Cor de fundo do AppBar
        actions: [
          // Botão para embaralhar receitas
          IconButton(
            icon: Icon(Icons.restart_alt),
            onPressed: _embaralharReceitas,
          ),
          SizedBox(width: 16),
        ],
      ),
      // Menu lateral (Drawer)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Cabeçalho do menu
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
            // Opções do menu
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
            // Categorias específicas
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
            // Favoritas e Sobre o App
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
      // Corpo principal da tela
      body: categoriaAtual == 'Favoritas' && receitasFavoritas.isEmpty
          ? Center(
              // Mensagem quando não há favoritos
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
          : GestureDetector(
              onVerticalDragUpdate: (details) {
                // Atualiza a posição do PageView com base no gesto
                _pageController.position.moveTo(
                  _pageController.position.pixels - details.delta.dy,
                );
              },
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: receitas.length,
                itemBuilder: (context, index) {
                  final receita = receitas[index];
                  return _buildReceitaCard(receita);
                },
              ),
            ),
      // Botão flutuante para alternar o estado de favorito
      // Botão flutuante de "favoritar", só aparece se:
// - houver receitas na tela
// - e não estivermos na aba de Favoritos com a lista vazia
      floatingActionButton: receitas.isEmpty ||
          (categoriaAtual == 'Favoritas' && receitasFavoritas.isEmpty)
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

  // Constrói o card de uma receita
  Widget _buildReceitaCard(Recipe receita) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calcula tamanhos proporcionais com base no tamanho da tela
        final double imageHeight = constraints.maxHeight * 0.25; // Reduzido para 15% da altura disponível
        final double fontSizeTitle = constraints.maxHeight * 0.03; // 3% da altura disponível
        final double fontSizeText = constraints.maxHeight * 0.02; // 2% da altura disponível

        return SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      receita.titulo,
                      style: TextStyle(
                        fontSize: fontSizeTitle, // Tamanho proporcional ao título
                        fontWeight: FontWeight.bold,
                      ),
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
              SizedBox(height: constraints.maxHeight * 0.02), // Espaçamento proporcional
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  receita.imagem,
                  height: imageHeight, // Altura reduzida da imagem
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.02),
              Text(
                receita.descricao,
                style: TextStyle(fontSize: fontSizeText), // Tamanho proporcional do texto
              ),
              SizedBox(height: constraints.maxHeight * 0.02),
              Text('Autor: ${receita.autor}', style: TextStyle(fontSize: fontSizeText)),
              Text('Tempo: ${receita.tempoPreparo}', style: TextStyle(fontSize: fontSizeText)),
              Text('Porções: ${receita.porcoes}', style: TextStyle(fontSize: fontSizeText)),
              Divider(height: constraints.maxHeight * 0.04),
              Text(
                'Ingredientes:',
                style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
              ),
              ...receita.ingredientes.map(
                (item) => Text('- $item', style: TextStyle(fontSize: fontSizeText)),
              ),
              Divider(height: constraints.maxHeight * 0.04),
              Text(
                'Modo de Preparo:',
                style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
              ),
              ...receita.modoPreparo.asMap().entries.map(
                    (e) => Text(
                      '${e.key + 1}. ${e.value}',
                      style: TextStyle(fontSize: fontSizeText),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
