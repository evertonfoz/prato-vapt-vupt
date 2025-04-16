import '../models/recipe.dart';

List<Recipe> receitasData = [
  Recipe(
    titulo: 'Bolo de Cenoura',
    descricao: 'Bolo fofinho com cobertura de chocolate.',
    imagem: 'assets/images/bolo.jfif',
    autor: 'Ana Souza',
    tempoPreparo: '45 min',
    porcoes: '8 porções',
    ingredientes: [
      '3 cenouras médias',
      '4 ovos',
      '1 xícara de óleo',
      '2 xícaras de açúcar',
      '2 e 1/2 xícaras de farinha de trigo',
      '1 colher de sopa de fermento em pó'
    ],
    modoPreparo: [
      'Bata no liquidificador as cenouras, ovos e óleo.',
      'Adicione o açúcar e bata mais.',
      'Misture com farinha e fermento.',
      'Asse por 40 min a 180ºC.'
    ],
  ),
  Recipe(
    titulo: 'Lasanha à Bolonhesa',
    descricao: 'Camadas de massa, molho e queijo.',
    imagem: 'assets/images/lasanha.jfif',
    autor: 'Carlos Dias',
    tempoPreparo: '1h',
    porcoes: '6 porções',
    ingredientes: [
      '500g de carne moída',
      '1 cebola picada',
      '1 molho de tomate',
      'Massa de lasanha',
      'Presunto e queijo',
      'Sal e temperos'
    ],
    modoPreparo: [
      'Refogue a carne com cebola e temperos.',
      'Adicione o molho de tomate.',
      'Monte camadas e leve ao forno por 30 min.'
    ],
  ),
  Recipe(
    titulo: 'Salada Tropical',
    descricao: 'Salada leve com frutas e folhas.',
    imagem: 'assets/images/salada.jfif',
    autor: 'Mariana Lima',
    tempoPreparo: '15 min',
    porcoes: '2 porções',
    ingredientes: [
      'Alface e rúcula',
      'Manga em cubos',
      'Morango fatiado',
      'Molho de iogurte'
    ],
    modoPreparo: [
      'Lave e corte os ingredientes.',
      'Misture tudo e adicione o molho.'
    ],
  ),
  Recipe(
    titulo: 'Feijoada',
    descricao: 'Prato típico com feijão e carnes.',
    imagem: 'assets/images/feijoada.jfif',
    autor: 'João Silva',
    tempoPreparo: '2h',
    porcoes: '10 porções',
    ingredientes: [
      '1kg feijão preto',
      'Linguiça calabresa',
      'Carne seca',
      'Costelinha',
      'Alho, cebola e temperos'
    ],
    modoPreparo: [
      'Cozinhe o feijão com as carnes.',
      'Tempere e deixe apurar.'
    ],
  ),
  Recipe(
    titulo: 'Panqueca de Banana',
    descricao: 'Panqueca doce e nutritiva.',
    imagem: 'assets/images/panqueca.jfif',
    autor: 'Paula Castro',
    tempoPreparo: '20 min',
    porcoes: '4 porções',
    ingredientes: [
      '2 bananas maduras',
      '2 ovos',
      'Canela a gosto',
      '1/2 xícara de aveia'
    ],
    modoPreparo: [
      'Amasse as bananas.',
      'Misture os ingredientes.',
      'Frite em frigideira antiaderente.'
    ],
  ),
  Recipe(
    titulo: 'Pizza Caseira',
    descricao: 'Pizza fácil de fazer em casa.',
    imagem: 'assets/images/pizza.jpg',
    autor: 'Fernanda Reis',
    tempoPreparo: '1h 10min',
    porcoes: '4 porções',
    ingredientes: [
      '2 xícaras de farinha de trigo',
      '1 colher fermento biológico',
      'Molho de tomate',
      'Mussarela e tomate'
    ],
    modoPreparo: [
      'Prepare a massa e deixe descansar.',
      'Abra, coloque o molho e recheio.',
      'Asse por 25 min a 200ºC.'
    ],
  ),
  Recipe(
    titulo: 'Tacos Mexicanos',
    descricao: 'Tortilhas com recheio temperado.',
    imagem: 'assets/images/tacos.jfif',
    autor: 'Luis Herrera',
    tempoPreparo: '30 min',
    porcoes: '4 porções',
    ingredientes: [
      'Tortilhas de milho',
      'Carne moída',
      'Alface e tomate',
      'Queijo e molho'
    ],
    modoPreparo: [
      'Tempere e refogue a carne.',
      'Monte os tacos com os ingredientes.'
    ],
  ),
  Recipe(
    titulo: 'Moqueca Baiana',
    descricao: 'Peixe com leite de coco e dendê.',
    imagem: 'assets/images/moqueca.jfif',
    autor: 'Pedro Bahia',
    tempoPreparo: '50 min',
    porcoes: '5 porções',
    ingredientes: [
      'Filé de peixe',
      'Leite de coco',
      'Azeite de dendê',
      'Pimentões e cebola'
    ],
    modoPreparo: [
      'Refogue os temperos.',
      'Adicione o peixe e cozinhe com o leite de coco.'
    ],
  ),
  Recipe(
    titulo: 'Frango Xadrez',
    descricao: 'Receita oriental com frango e legumes.',
    imagem: 'assets/images/frango.jfif',
    autor: 'Julia Kenji',
    tempoPreparo: '25 min',
    porcoes: '3 porções',
    ingredientes: [
      'Peito de frango em cubos',
      'Pimentões',
      'Cebola',
      'Molho shoyu'
    ],
    modoPreparo: [
      'Frite o frango.',
      'Adicione legumes e shoyu.',
      'Cozinhe por 10 min.'
    ],
  ),
  Recipe(
    titulo: 'Brigadeiro',
    descricao: 'Doce brasileiro com chocolate.',
    imagem: 'assets/images/brigadeiro.jfif',
    autor: 'Rafaela Dias',
    tempoPreparo: '20 min',
    porcoes: '20 unidades',
    ingredientes: [
      '1 lata de leite condensado',
      '2 colheres de chocolate em pó',
      '1 colher de manteiga',
      'Chocolate granulado'
    ],
    modoPreparo: [
      'Misture os ingredientes em fogo baixo.',
      'Mexa até desgrudar da panela.',
      'Enrole e passe no granulado.'
    ],
  ),
  Recipe(
    titulo: 'Escondidinho de Carne',
    descricao: 'Purê com carne moída e queijo.',
    imagem: 'assets/images/escondidinho.jfif',
    autor: 'Roberto Almeida',
    tempoPreparo: '40 min',
    porcoes: '6 porções',
    ingredientes: [
      'Purê de batata',
      'Carne moída',
      'Queijo ralado',
      'Cebola e temperos'
    ],
    modoPreparo: [
      'Refogue a carne.',
      'Monte com purê, carne e queijo.',
      'Gratine no forno.'
    ],
  ),
  Recipe(
    titulo: 'Coxinha',
    descricao: 'Salgado recheado com frango desfiado.',
    imagem: 'assets/images/coxinha.jfif',
    autor: 'Lúcia Gomes',
    tempoPreparo: '1h',
    porcoes: '20 unidades',
    ingredientes: [
      '1 litro de caldo de galinha',
      '2 xícaras de farinha de trigo',
      'Recheio de frango',
      'Farinha de rosca e óleo'
    ],
    modoPreparo: [
      'Faça a massa com o caldo e farinha.',
      'Modele com recheio, empane e frite.'
    ],
  ),
  Recipe(
    titulo: 'Risoto de Camarão',
    descricao: 'Risoto cremoso com frutos do mar.',
    imagem: 'assets/images/risoto.jfif',
    autor: 'Alberto Souza',
    tempoPreparo: '45 min',
    porcoes: '4 porções',
    ingredientes: [
      'Camarão limpo',
      'Arroz arbório',
      'Caldo de legumes',
      'Vinho branco',
      'Parmesão'
    ],
    modoPreparo: [
      'Refogue o arroz e adicione vinho.',
      'Vá adicionando o caldo e mexa.',
      'Adicione o camarão e finalize com queijo.'
    ],
  ),
  Recipe(
    titulo: 'Pão de Queijo',
    descricao: 'Tradicional receita mineira.',
    imagem: 'assets/images/paodequeijo.jfif',
    autor: 'Renata Freitas',
    tempoPreparo: '35 min',
    porcoes: '20 unidades',
    ingredientes: [
      '500g de polvilho doce',
      '250ml de leite',
      '2 ovos',
      '100ml de óleo',
      '200g de queijo ralado'
    ],
    modoPreparo: [
      'Misture tudo até formar uma massa.',
      'Modele bolinhas e asse a 180ºC por 25 min.'
    ],
  ),
  Recipe(
    titulo: 'Omelete de Forno',
    descricao: 'Fácil e rápido, assado e nutritivo.',
    imagem: 'assets/images/omelete.jfif',
    autor: 'Fábio Mendes',
    tempoPreparo: '30 min',
    porcoes: '4 porções',
    ingredientes: [
      '4 ovos',
      'Legumes picados',
      'Presunto e queijo',
      'Sal, pimenta e orégano'
    ],
    modoPreparo: [
      'Misture tudo em uma tigela.',
      'Despeje em forma untada.',
      'Asse por 25 min a 180ºC.'
    ],
  ),
];
