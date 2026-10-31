// Nome: Luciara Silva Pereira e Vivian Gomes Leal

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferências Musicais',
      home: TelaInicial(),
    );
  }
}

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

class TelaInicial extends StatefulWidget {
  TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  List<GeneroMusical> generos = [
    GeneroMusical(
      nome: 'Rock',
      descricao: 'Gênero marcado por guitarras, bateria e ritmos intensos.',
      imagem:
          'https://images.unsplash.com/photo-1524368535928-5b5e00ddc76b?w=300',
    ),
    GeneroMusical(
      nome: 'Pop',
      descricao: 'Música popular com melodias marcantes e ritmos variados.',
      imagem:
          'https://images.unsplash.com/photo-1501386761578-eac5c94b800a?w=300',
    ),
    GeneroMusical(
      nome: 'Sertanejo',
      descricao: 'Gênero brasileiro conhecido por suas histórias e melodias.',
      imagem:
          'https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=300',
    ),
    GeneroMusical(
      nome: 'Samba',
      descricao: 'Gênero brasileiro com ritmos marcantes e percussão.',
      imagem:
          'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?w=300',
    ),
    GeneroMusical(
      nome: 'Jazz',
      descricao: 'Estilo musical que valoriza a improvisação e a expressividade.',
      imagem:
          'https://images.unsplash.com/photo-1415201364774-f6f0bb35f28f?w=300',
    ),
    GeneroMusical(
      nome: 'Eletrônica',
      descricao: 'Música produzida com instrumentos e recursos eletrônicos.',
      imagem:
          'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=300',
    ),
  ];

  void abrirConfiguracoes(GeneroMusical genero) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaConfiguracoes(genero: genero),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luciara Silva Pereira & Vivian Gomes Music'),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Minhas Preferências Musicais',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
          ),
          for (GeneroMusical genero in generos)
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    genero.imagem,
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 65,
                        height: 65,
                        color: Colors.green.shade100,
                        child: Icon(
                          Icons.music_note,
                          color: Colors.green.shade700,
                        ),
                      );
                    },
                  ),
                ),
                title: Text(
                  genero.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  genero.gosta ? 'Você gosta deste gênero' : 'Não selecionado',
                ),
                trailing: Switch(
                  value: genero.gosta,
                  activeColor: Colors.white,
                  activeThumbColor: Colors.green.shade700,
                  onChanged: (valor) {
                    setState(() {
                      genero.gosta = valor;
                    });
                  },
                ),
                onTap: () {
                  abrirConfiguracoes(genero);
                },
              ),
            ),
        ],
      ),
    );
  }
}

class TelaConfiguracoes extends StatefulWidget {
  final GeneroMusical genero;

  TelaConfiguracoes({super.key, required this.genero});

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genero.nome),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              widget.genero.nome,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            SizedBox(height: 15),
            Text(
              widget.genero.descricao,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Text(
              'Volume preferido: ${widget.genero.volume.round()}%',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: widget.genero.volume,
              min: 0,
              max: 100,
              divisions: 100,
              label: widget.genero.volume.round().toString(),
              activeColor: Colors.green.shade700,
              inactiveColor: Colors.green.shade100,
              onChanged: (valor) {
                setState(() {
                  widget.genero.volume = valor;
                });
              },
            ),
            SizedBox(height: 15),
            CheckboxListTile(
              title: Text(
                'Desejo receber recomendações deste gênero',
              ),
              value: widget.genero.receberRecomendacoes,
              activeColor: Colors.green.shade700,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (valor) {
                setState(() {
                  widget.genero.receberRecomendacoes = valor!;
                });
              },
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(15),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Preferências de ${widget.genero.nome} salvas!',
                    ),
                    backgroundColor: Colors.green.shade800,
                  ),
                );
              },
              child: Text(
                'Salvar Preferências',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}