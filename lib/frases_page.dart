import 'package:flutter/material.dart';
import 'dart:math';

// |  Esta é a página de frases diárias aleatorias  |
// | Rodrigo Costa - 03/12/2024 - frases_page.dart  |
// |             AP2 - Faculdade CDL                |

class FrasesPage extends StatefulWidget {
  @override
  _FrasesPageState createState() => _FrasesPageState();
}

class _FrasesPageState extends State<FrasesPage> {
  final List<String> frases = [
    '"Acredite em si mesmo."',
    '"Cada dia é uma nova oportunidade."',
    '"Nunca desista dos seus sonhos."',
    '"A felicidade está no caminho, não no destino."',
    '"Seja a mudança que você quer ver no mundo."',
    '"O único lugar onde o sucesso vem antes do trabalho é no dicionário."',
    '"A vida é feita de escolhas, então escolha ser feliz."',
    '"Não espere por uma oportunidade, crie uma."',
    '"A persistência é o caminho do êxito."',
    '"Sonhe grande, comece pequeno e vá com fé."',
    '"O sucesso é a soma de pequenos esforços repetidos dia após dia."',
    '"Acredite que você pode, assim você já está no meio do caminho."',
    '"O maior erro que você pode cometer é o de ter medo de cometer erros."',
    '"Faça hoje o que outros não querem, faça amanhã o que outros não podem."',
    '"A maior glória em viver não está em nunca cair, mas em levantar cada vez que caímos."',
    '"Não se preocupe com os fracassos, preocupe-se com as chances que você perde quando nem tenta."',
    '"Cada conquista começa com a decisão de tentar."',
    '"O futuro pertence àqueles que acreditam na beleza dos seus sonhos."',
    '"O que você fizer de bom será lembrado por muito tempo."',
    '"O melhor ainda está por vir."',
    '"A jornada de mil milhas começa com um simples passo."',
    '"A vida é 10% o que acontece com você e 90% como você reage."',
    '"Não importa quantas vezes você falhe, o importante é quantas vezes você tenta novamente."',
    '"Se você quer algo que nunca teve, precisa fazer algo que nunca fez."',
    '"Acredite que você é capaz, porque você é."',
    '"Cada dia é uma nova chance de mudar a sua vida."',
    '"O sucesso não é final, o fracasso não é fatal: o que conta é a coragem de continuar."',
    '"A diferença entre quem você é e quem você quer ser é o que você faz."',
    '"A vida começa onde a zona de conforto termina."',
    '"Você nunca sabe o quão forte você é, até que ser forte seja sua única opção."',
    '"É nos momentos de decisão que o seu destino é traçado."',
    '"O sucesso geralmente vem para aqueles que estão muito ocupados para procurar por ele."',
    '"Não é sobre o quão rápido você vai, mas sobre nunca desistir."',
    '"Quando você para de tentar, é quando falha."',
    '"O maior obstáculo para o sucesso é o medo do fracasso."',
    '"Não é o que você faz, mas como você faz que faz a diferença."',
    '"Faça o que você ama e nunca mais precisará trabalhar um dia na vida."',
    '"O melhor modo de prever o futuro é criá-lo."',
    '"A única maneira de fazer um excelente trabalho é amar o que você faz."',
    '"Acredite em milagres, mas não dependa deles."',
    '"Cada grande sonho começa com um sonhador."',
    '"Os desafios são o que tornam a vida interessante e superá-los é o que faz a vida significativa."',
    '"O fracasso é apenas o tempero que dá sabor ao sucesso."',
    '"O segredo do sucesso é começar."',
    '"A persistência supera o talento, quando o talento não se empenha."',
    '"O impossível é apenas uma opinião."',
    '"A vida é uma aventura ousada ou não é nada."',
    '"Não limite seus desafios, desafie seus limites."',
    '"Não pare quando estiver cansado, pare quando terminar."',
    '"A maior parte do que você tem é resultado do que você fez no passado."',
    '"A vida não é esperar a tempestade passar, é aprender a dançar na chuva."',
    '"Viva a vida com entusiasmo, sem medo de errar."',
    '"Quando tudo parecer estar indo mal, lembre-se que as estrelas brilham mais forte na escuridão."',
    '"O maior inimigo da criatividade é o bom senso."',
    '"Às vezes, as melhores coisas da vida acontecem quando você se permite sair da sua zona de conforto."',
    '"Se você não sabe onde quer ir, qualquer caminho serve."',
    '"O sucesso é a habilidade de ir de fracasso em fracasso sem perder o entusiasmo."',
    '"A vida é uma questão de escolhas. Se você não escolhe o que quer, alguém o fará por você."',
    '"Com coragem e perseverança, qualquer coisa é possível."',
    '"Não tenha medo de ser grandioso."',
    '"Nunca é tarde para ser o que você poderia ter sido."',
    '"Acredite nos seus sonhos, mesmo que eles pareçam impossíveis."',
    '"Nada é impossível para aquele que tenta."',
    '"Nunca subestime o poder de um sonho."',
    '"Sua atitude determina sua direção."',
    '"Siga em frente, o melhor está por vir."',
    '"Acredite no impossível e o possível acontecerá."',
    '"É quando você desiste que o sucesso desiste de você."',
    '"As grandes coisas não acontecem em zonas de conforto."',
    '"Cada grande jornada começa com um pequeno passo."',
    '"A mudança começa dentro de você."',
    '"A vida recompensa aqueles que se esforçam e não desistem."',
    '"Se você quer alcançar grandes alturas, precisa estar disposto a cair primeiro."',
    '"Não espere por oportunidades, crie-as."',
    '"Foque no que você pode controlar e ignore o que você não pode."',
    '"Grandes realizações começam com pequenos passos."'
  ];

  String fraseAtual = 'Clique no botão para gerar uma nova frase.';

  void _gerarNovaFrase() {
    final random = Random();
    setState(() {
      fraseAtual = frases[random.nextInt(frases.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Frases do Dia')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                fraseAtual,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _gerarNovaFrase,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.purpleAccent,
                elevation: 5,
              ),
              child: Text(
                'Nova Frase',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
