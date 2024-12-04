import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

// |     PÁGINA DO JOGO FLAPPY BIRD, JOGO 3 DECIDIDO     |
// | Rodrigo Costa - 03/12/2024 - flappy_bird_page.dart  |
// |                AP2 - Faculdade CDL                  |

class Bird {
  double x;
  double y;
  double width = 48.0;
  double height = 48.0; 
  double vy = 0.0;

  Bird({required this.x, required this.y});
}

class Pipe {
  double x;
  double y;
  double height;
  double width = 100.0;
  bool passed = false;

  Pipe({required this.x, required this.y, required this.height});
}

class FlappyBirdPage extends StatefulWidget {
  const FlappyBirdPage({super.key});

  @override
  State<FlappyBirdPage> createState() => _FlappyBirdPageState();
}

class _FlappyBirdPageState extends State<FlappyBirdPage> {
  final fps = const Duration(milliseconds: 10);

  final flappy = Bird(x: 100, y: 100);
  final pipes = <Pipe>[];

  final pipeGap = 160.0;
  double velocity = 2.0;
  final gravity = 0.1;
  final force = 3.5;

  Size size = const Size(480, 720);
  Timer? timer;

  int score = 0;
  bool started = false;
  bool gameOver = false;

  double randomRange(int min, int max) {
    return (min + Random().nextInt((max + 1) - min)).toDouble();
  }

  void spawPipes() {
    for (var i = 0; i < 10; i++) {
      var x = size.width + (size.width * i);
      var hTop = randomRange(0, size.height ~/ 2);
      var hBottom = size.height - hTop - pipeGap;

      pipes.addAll([
        Pipe(x: x, y: 0, height: hTop),
        Pipe(x: x, y: size.height - hBottom, height: hBottom)
      ]);
    }
  }

void update() {
  timer = Timer.periodic(fps, (t) {
    setState(() {
      if (!gameOver) { // Apenas atualiza quando o jogo não estiver em game over
        flappy.y += flappy.vy;

        if (flappy.y + flappy.vy + flappy.height < size.height) {
          flappy.vy += gravity;
        } else {
          gameOver = true;
        }

        for (var pipe in pipes) {
          pipe.x -= velocity;

          if (flappy.x < pipe.x + pipe.width &&
              flappy.x + flappy.width > pipe.x &&
              flappy.y + flappy.vy < pipe.y + pipe.height &&
              flappy.y + flappy.vy + flappy.height > pipe.y) {
            gameOver = true;
            break;
          }

          if (pipe.x + pipe.width < flappy.x && !pipe.passed) {
            pipe.passed = true;
            score++;
          }
        }

        pipes.removeWhere((p) => p.x + p.width < 0);

        if (pipes.isEmpty) {
          spawPipes();
        }

        if (score % 5 == 0 && velocity < 5.0) {
          velocity += 0.05;
        }
      } else {
        timer?.cancel(); // Cancela o timer quando o jogo termina
      }
    });
  });
}


  void reset() {
    flappy.x = 30;
    flappy.y = 100;
    flappy.vy = 0;
    score = 0;
    pipes.clear();
    gameOver = false;
    velocity = 2.0;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () {
            if (started && !gameOver) {
              flappy.vy = -force;
            } else if (gameOver) {
              reset();
            } else {
              started = true;
              update();
            }
          },
          child: Container(
            width: size.width,
            height: size.height,
            color: Colors.blue.shade300,
            child: Stack(
              children: [
                if (started && !gameOver)
                  AnimatedPositioned(
                    left: flappy.x,
                    top: flappy.y,
                    duration: fps,
                    child: Image.asset(
                      'assets/passarinho.png',
                      width: flappy.width,
                      height: flappy.height,
                    ),
                  ),
            for (var pipe in pipes)
              AnimatedPositioned(
                top: pipe.y,
                left: pipe.x,
                duration: fps,
                child: Stack(
                  children: [
                    // Corpo do cano (sem bordas arredondadas)
                    Container(
                      width: pipe.width * 0.6,
                      height: pipe.height,
                      color: Colors.green,
                    ),
                    // Retângulo nas extremidades superiores
                    Positioned(
                      top: 0,
                      left: pipe.width * 0.6 - 10, // Ajusta a posição do retângulo
                      child: Container(
                        width: 10, // Largura do retângulo
                        height: 20, // Altura do retângulo (parte superior do cano)
                        color: Colors.green,
                      ),
                    ),
                    // Retângulo nas extremidades inferiores
                    Positioned(
                      bottom: 0,
                      left: pipe.width * 0.6 - 10, // Ajusta a posição do retângulo
                      child: Container(
                        width: 10, // Largura do retângulo
                        height: 20, // Altura do retângulo (parte inferior do cano)
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
                if (started && !gameOver)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "PONTUAÇÃO\n$score",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(color: Colors.black, offset: Offset(1.5, 1.5))
                        ],
                      ),
                    ),
                  ),
                    if (!started)
                    Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange, // Cor do botão
                            minimumSize: const Size(200, 50), // Tamanho do botão
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Bordas arredondadas
                            ),
                            shadowColor: Colors.orangeAccent, // Cor da sombra
                            elevation: 5, // Sombra
                        ),
                        onPressed: () {
                            setState(() {
                            started = true;
                            update();
                            });
                        },
                        child: const Text(
                            "TOQUE PARA COMEÇAR",
                            style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                            ),
                        ),
                        ),
                    ),
                if (gameOver)
                Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Text(
                        'GAME OVER',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                        'PONTUAÇÃO: $score',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,  // Cor vermelha para "Voltar"
                            foregroundColor: Colors.white, 
                            minimumSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),  // Bordas levemente arredondadas
                            ),
                            elevation: 3,  // Efeito de sombra sutil
                        ),
                        onPressed: () {
                            Navigator.pop(context); // Botão voltar
                        },
                        child: const Text('VOLTAR'),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,  // Cor laranja para "Reiniciar"
                            foregroundColor: Colors.white,  // Texto branco
                            minimumSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),  // Bordas levemente arredondadas
                            ),
                            elevation: 3,  // Efeito de sombra sutil
                        ),
                        onPressed: reset,  // Função de reinício
                        child: const Text('REINICIAR'),
                        ),
                    ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
