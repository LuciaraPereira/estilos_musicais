import 'package:flutter/material.dart';
import '../models/genero_musical.dart';
import 'tela_configuracoes.dart';

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
      descricao:
          'Estilo musical que valoriza a improvisação e a expressividade.',
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
        title: Text('Luciara Silva Pereira & Vivian Gomes '),
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
                  genero.gosta
                      ? 'Você gosta deste gênero'
                      : 'Não selecionado',
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