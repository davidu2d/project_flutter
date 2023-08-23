import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main(List<String> args) => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _resetForm() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
        centerTitle: true,
      ),
      body: temPerguntaSelecionada
          ? Column(
              children: <Widget>[
                Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                ...respostas.map((e) => Resposta(e, _responder)).toList(),
              ],
            )
          : Center(
              child: Column(children: [
                Text(
                  'Parabéns!!',
                  style: TextStyle(fontSize: 28),
                ),
                ElevatedButton(
                    onPressed: _resetForm,
                    child: Text("Iniciar Novamente!"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue)),
              ]),
            ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
