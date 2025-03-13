import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaInicial(),
  ));
}

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final List<String> opcoes = ["pedra", "papel", "tesoura"];

  void jogar(String escolhaUsuario) {
    String escolhaApp = opcoes[Random().nextInt(3)];
    String resultado;

    if (escolhaUsuario == escolhaApp) {
      resultado = "Empate";
    } else if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      resultado = "Você Venceu!";
    } else {
      resultado = "Você Perdeu!";
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoScreen(
          escolhaUsuario: escolhaUsuario,
          escolhaApp: escolhaApp,
          resultado: resultado,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pedra, Papel, Tesoura")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/padrao.png", height: 140),
          SizedBox(height: 20),
          Text("Escolha sua jogada"),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => jogar("pedra"),
                child: Image.asset("assets/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => jogar("papel"),
                child: Image.asset("assets/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => jogar("tesoura"),
                child: Image.asset("assets/tesoura.png", height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ResultadoScreen extends StatelessWidget {
  final String escolhaUsuario;
  final String escolhaApp;
  final String resultado;

  ResultadoScreen({
    required this.escolhaUsuario,
    required this.escolhaApp,
    required this.resultado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resultado")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Escolha do APP"),
          Image.asset("assets/$escolhaApp.png", height: 140),
          SizedBox(height: 20),
          Text("Sua Escolha"),
          Image.asset("assets/$escolhaUsuario.png", height: 140),
          SizedBox(height: 20),
          Image.asset(
            resultado == "Você Venceu!"
                ? "assets/icons8-vitória-48.png"
                : resultado == "Você Perdeu!"
                ? "assets/icons8-perder-48.png"
                : "assets/icons8-aperto-de-maos-100.png",
            height: 100,
          ),
          SizedBox(height: 20),
          Text(resultado, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Jogar Novamente"),
          ),
        ],
      ),
    );
  }
}




