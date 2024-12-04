import 'dart:math';
import 'package:flutter/material.dart';

// |             PÁGINA DO JOGO Cara ou Coroa              |
// | Rodrigo Costa - 03/12/2024 - cara_ou_coroa_page.dart  |
// |                 AP2 - Faculdade CDL                   |

class CaraOuCoroaPage extends StatefulWidget {
  @override
  _CaraOuCoroaPageState createState() => _CaraOuCoroaPageState();
}

class _CaraOuCoroaPageState extends State<CaraOuCoroaPage> {
  String resultado = '';
  String escolhaUsuario = '';
  String escolhaComputador = '';

  final List<String> opcoes = ['Cara', 'Coroa'];

  void jogar(String escolha) {
    // O usuário fez a escolha
    setState(() {
      escolhaUsuario = escolha;
      // Escolha do computador (aleatória)
      escolhaComputador = opcoes[Random().nextInt(opcoes.length)];
      // Comparando as escolhas e gerando o resultado
      if (escolhaUsuario == escolhaComputador) {
        resultado = "Você venceu!";
      } else {
        resultado = "Você perdeu!";
      }
    });
  }

  // Função para formatar o texto com a cor adequada
  Text _formatarTexto(String texto, bool vitoria) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: vitoria ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara ou Coroa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Exibindo o resultado
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Exibindo as imagens lado a lado
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    jogar('Cara');
                  },
                  child: Image.asset(
                    'assets/cara.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    jogar('Coroa');
                  },
                  child: Image.asset(
                    'assets/coroa.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Exibindo as escolhas do usuário e do computador, apenas se já houver uma escolha
            if (escolhaUsuario.isNotEmpty && escolhaComputador.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _formatarTexto('Você escolheu: $escolhaUsuario', escolhaUsuario == escolhaComputador),
                  SizedBox(width: 20),
                  _formatarTexto('E caiu: $escolhaComputador', escolhaUsuario == escolhaComputador),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
