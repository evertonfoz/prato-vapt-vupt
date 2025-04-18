<<<<<<< HEAD
# prato-vapt-vupt
=======
# 🍳 Prato Vapt Vupt

Um aplicativo Flutter para receitas culinárias com interface inspirada no estilo TikTok, permitindo uma navegação vertical fluida entre as receitas.

## 📱 Funcionalidades

- **Navegação Vertical**: Deslize para cima/baixo para ver diferentes receitas
- **Categorização**: Receitas organizadas em:
  - 🍰 Doces
  - 🍝 Salgados
  - 🥪 Lanches
- **Sistema de Favoritos**: 
  - ❤️ Favorite suas receitas preferidas
  - Acesse rapidamente pela aba de favoritos
  - Botão flutuante para favoritar receita atual
- **Receitas Detalhadas**:
  - Título e descrição
  - Imagem do prato
  - Tempo de preparo
  - Porções
  - Lista de ingredientes
  - Modo de preparo passo a passo
- **Interface Intuitiva**:
  - Menu lateral de fácil acesso
  - Botão para embaralhar receitas
  - Design moderno e clean

## 🏗️ Estrutura do Projeto

```
lib/
├── data/
│   └── recipe_data.dart     # Dados das receitas
├── models/
│   └── recipe.dart          # Modelo de dados da receita
├── screens/
│   └── home_screen.dart     # Tela principal do app
├── widgets/
│   ├── recipe_card.dart     # Card de exibição da receita
│   └── custom_drawer.dart   # Menu lateral personalizado
└── main.dart                # Ponto de entrada do aplicativo
```

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento multiplataforma
- **Dart**: Linguagem de programação
- **Material Design**: Sistema de design para interface
- **PageView**: Para navegação vertical estilo TikTok
- **StatefulWidget**: Para gerenciamento de estado local

## 📦 Como Executar

1. **Pré-requisitos**:
   - Flutter SDK instalado
   - Um editor (VS Code, Android Studio, etc.)
   - Um emulador ou dispositivo físico

2. **Clone o repositório**:
   ```bash
   git clone [URL_DO_REPOSITÓRIO]
   ```

3. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

4. **Execute o aplicativo**:
   ```bash
   flutter run
   ```

## 📁 Organização do Código

- **`main.dart`**: Configuração inicial do app, tema e rotas
- **`recipe.dart`**: Modelo de dados com propriedades da receita
- **`recipe_data.dart`**: Banco de dados local com as receitas
- **`home_screen.dart`**: Tela principal com lógica de navegação e filtros
- **`recipe_card.dart`**: Widget personalizado para exibição da receita
- **`custom_drawer.dart`**: Menu lateral com categorias e opções

## 🎨 Design e UI

- **Cores**:
  - Principal: Deep Orange
  - Ícones de favorito: Vermelho
  - Texto: Preto e Cinza
- **Tipografia**: Roboto (padrão Material Design)
- **Imagens**: Armazenadas em `assets/images/`
- **Layouts**: Responsivo e adaptável a diferentes tamanhos de tela

## 🤝 Contribuição

Este é um projeto colaborativo e contribuições são bem-vindas! Para contribuir:

1. Faça um Fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/NovaFeature`)
3. Commit suas mudanças (`git commit -m 'Add: Nova Feature'`)
4. Push para a branch (`git push origin feature/NovaFeature`)
5. Abra um Pull Request

## 📝 Notas de Desenvolvimento

- Projeto desenvolvido com foco em simplicidade e usabilidade
- Interface inspirada em apps modernos de conteúdo vertical
- Sistema de favoritos com persistência em memória
- Categorização dinâmica das receitas

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## ✨ Agradecimentos

- Equipe de desenvolvimento
- Contribuidores
- Comunidade Flutter

---
Desenvolvido com ❤️ pela equipe Prato Vapt Vupt
>>>>>>> origin/master
