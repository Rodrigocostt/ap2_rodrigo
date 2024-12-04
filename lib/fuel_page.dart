import 'package:flutter/material.dart';

// |   Esta é a página de combustível do projeto    |
// | Rodrigo Costa - 03/12/2024 - fuel_page.dart    |
// |             AP2 - Faculdade CDL                |

class FuelPage extends StatefulWidget {
  @override
  _FuelPageState createState() => _FuelPageState();
}

class _FuelPageState extends State<FuelPage> {
  final TextEditingController _alcoolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();
  String resultado = '';

  void _calcularMelhorCombustivel() {
    double? precoAlcool = double.tryParse(_alcoolController.text);
    double? precoGasolina = double.tryParse(_gasolinaController.text);

    if (precoAlcool != null && precoGasolina != null) {
      double resultadoCalculado = precoAlcool / precoGasolina;
      setState(() {
        resultado = (resultadoCalculado < 0.7)
            ? 'Melhor abastecer com Álcool'
            : 'Melhor abastecer com Gasolina';
      });
    } else {
      setState(() {
        resultado = 'Preencha ambos os campos corretamente!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escolha de Combustível')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Entenda como o cálculo é feito:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[700],
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Dividimos o valor do litro do álcool pelo da gasolina.\n\n"
                        "Quando o resultado é menor que 0,7, a recomendação é abastecer com álcool. Se maior, a recomendação é escolher a gasolina.\n\n"
                        "Exemplo: se o álcool custa R\$ 3,29 e a gasolina R\$ 4,92, o resultado da divisão do primeiro pelo segundo é 0,67, menor que 0,7. Portanto, é mais vantajoso abastecer com álcool.\n\n"
                        "Quando o preço do álcool for menor que 70% do preço da gasolina, é mais vantajoso abastecer com álcool, pois o custo-benefício é melhor.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _alcoolController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Preço do Álcool',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _gasolinaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Preço da Gasolina',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _calcularMelhorCombustivel,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                resultado,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
