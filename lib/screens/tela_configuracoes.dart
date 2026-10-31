import 'package:flutter/material.dart';
import '../models/genero_musical.dart';

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