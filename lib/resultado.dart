import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reset;
  Resultado(this.pontuacao, this.reset);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns: $pontuacao pontos';
    } else if (pontuacao < 12) {
      return 'Você é bom: $pontuacao pontos';
    } else if (pontuacao < 16) {
      return 'Impressionante: $pontuacao pontos';
    } else {
      return 'Nível Jedi: $pontuacao pontos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
            onPressed: reset,
            child: Text("Iniciar Novamente!"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue))
      ],
    );
  }
}
