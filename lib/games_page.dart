import 'package:flutter/material.dart';
import 'jokenpo_page.dart'; // importa a página do jokenpo
import 'cara_ou_coroa_page.dart'; // importa a página do cara ou coroa
import 'flappy_bird_page.dart'; // Importa a página do Flappy Bird

// |      Esta é a página de escolha de jogos       |
// | Rodrigo Costa - 02/12/2024 - games_page.dart   |
// |             AP2 - Faculdade CDL                |

void main() {
  runApp(MyApp());  // Definindo o ponto de entrada do aplicativo
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Jogos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamesPage(),  // Página principal do aplicativo
    );
  }
}

class GamesPage extends StatelessWidget {
  // Função para criar um botão
  ElevatedButton _buildGameButton(BuildContext context, String text, Color color, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page), // Navega para a página do jogo
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Cor do botão
        minimumSize: Size(200, 50), // Tamanho do botão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordas arredondadas
        ),
        shadowColor: color.withOpacity(0.7), // Cor da sombra
        elevation: 5, // Sombra
      ),
      child: Text(
        text, // Texto do botão
        style: TextStyle(
          color: Colors.white, // Cor do texto
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogos'), // Título da página
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os botões
          children: [
            _buildGameButton(context, 'Jokenpô', Colors.blue, JokenpoPage()), // Botão para Jokenpô
            SizedBox(height: 20), // Espaço entre os botões
            _buildGameButton(context, 'Cara ou Coroa', Colors.green, CaraOuCoroaPage()), // Botão para Cara ou Coroa
            SizedBox(height: 20), // Espaço entre os botões
            _buildGameButton(context, 'Flappy Bird', Colors.orange, FlappyBirdPage()), // Botão para Flappy Bird
          ],
        ),
      ),
    );
  }
}
