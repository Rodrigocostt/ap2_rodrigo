import 'package:flutter/material.dart';
import 'dart:math';

// |           Página do jogo 1 - JOKENPÔ             |
// | Rodrigo Costa - 02/12/2024 - jokenpo_page.dart   |
// |              AP2 - Faculdade CDL                 |

class JokenpoPage extends StatefulWidget {
  @override
  _JokenpoPageState createState() => _JokenpoPageState();
}

class _JokenpoPageState extends State<JokenpoPage> {
  var _mensagem = "Faça sua escolha:";
  var _imagemApp = AssetImage("assets/padrao.png");

  // Variáveis para controlar a escala das imagens
  double _escalaPedra = 1;
  double _escalaPapel = 1;
  double _escalaTesoura = 1;

  // Método para determinar o vencedor
  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var escolhaApp = opcoes[Random().nextInt(opcoes.length)];

    setState(() {
      _imagemApp = AssetImage("assets/$escolhaApp.png");
    });

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _mensagem = "Você ganhou!";
      });
    } else if (escolhaUsuario == escolhaApp) {
      setState(() {
        _mensagem = "Empate!";
      });
    } else {
      setState(() {
        _mensagem = "Você perdeu!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpô'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: _imagemApp),
          Text(
            _mensagem,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Pedra
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _escalaPedra = 1.1; // Aumenta a escala da imagem
                  });
                },
                onExit: (_) {
                  setState(() {
                    _escalaPedra = 1; // Restaura a escala original
                  });
                },
                child: GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Transform.scale(
                    scale: _escalaPedra, // Aplica o efeito de escala
                    child: Image.asset("assets/pedra.png", height: 100),
                  ),
                ),
              ),
              // Papel
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _escalaPapel = 1.1; // Aumenta a escala da imagem
                  });
                },
                onExit: (_) {
                  setState(() {
                    _escalaPapel = 1; // Restaura a escala original
                  });
                },
                child: GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Transform.scale(
                    scale: _escalaPapel, // Aplica o efeito de escala
                    child: Image.asset("assets/papel.png", height: 100),
                  ),
                ),
              ),
              // Tesoura
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _escalaTesoura = 1.1; // Aumenta a escala da imagem
                  });
                },
                onExit: (_) {
                  setState(() {
                    _escalaTesoura = 1; // Restaura a escala original
                  });
                },
                child: GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Transform.scale(
                    scale: _escalaTesoura, // Aplica o efeito de escala
                    child: Image.asset("assets/tesoura.png", height: 100),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
