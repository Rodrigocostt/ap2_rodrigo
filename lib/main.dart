import 'package:flutter/material.dart';
import 'games_page.dart';
import 'frases_page.dart';
import 'fuel_page.dart';

// | Esta é a página inicial do nosso projeto |
// | Rodrigo Costa - 02/12/2024 - main.dart   |
// |          AP2 - Faculdade CDL             |

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF212121),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF212121),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial - AP2 Rodrigo Costa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButtonRow(context),
            SizedBox(height: 20),
            _buildButton(
              context,
              label: 'Combustível',
              color: Colors.orangeAccent,
              destinationPage: FuelPage(),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir a linha de botões de jogos e frases
  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(
          context,
          label: 'Jogos',
          color: Colors.blueAccent,
          destinationPage: GamesPage(),
        ),
        SizedBox(width: 20),
        _buildButton(
          context,
          label: 'Frase do Dia',
          color: Colors.redAccent,
          destinationPage: FrasesPage(),
        ),
      ],
    );
  }

  // Método reutilizável para criar botões
  Widget _buildButton(BuildContext context, {required String label, required Color color, required Widget destinationPage}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Cor do botão
        minimumSize: Size(200, 50), // Tamanho do botão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordas arredondadas
        ),
        shadowColor: color, // Cor da sombra
        elevation: 5, // Sombra
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white, // Cor da letra
          fontSize: 18,
        ),
      ),
    );
  }
}
