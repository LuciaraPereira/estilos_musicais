class GeneroMusical {
  String nome;
  String descricao;
  String imagem;
  bool gosta;
  double volume;
  bool receberRecomendacoes;

  GeneroMusical({
    required this.nome,
    required this.descricao,
    required this.imagem,
    this.gosta = false,
    this.volume = 50,
    this.receberRecomendacoes = false,
  });
}