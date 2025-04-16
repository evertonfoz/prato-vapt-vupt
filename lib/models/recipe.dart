class Recipe {
  final String titulo;
  final String descricao;
  final String imagem;
  final String autor;
  final String tempoPreparo;
  final String porcoes;
  final List<String> ingredientes;
  final List<String> modoPreparo;
  bool favorito;

  Recipe({
    required this.titulo,
    required this.descricao,
    required this.imagem,
    required this.autor,
    required this.tempoPreparo,
    required this.porcoes,
    required this.ingredientes,
    required this.modoPreparo,
    this.favorito = false,
  });
}
