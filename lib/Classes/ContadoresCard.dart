import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:portalsped/Classes/navegacao.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/contadores_repository.dart';

class ContadoresCard {
  static createListaContadores() async {
    List<Widget> lista = [];
    final contadores = await ContadoreRepository.getContadores();

    for (int i = 0; i < contadores.length; i++) {
      lista.add(
        Hero(
          tag: 'hero-container-$i',
          child: CardContadores(indice: i, contador: contadores[i]),
        ),
      );
    }
    return lista;
  }
}

class CardContadores extends material.StatelessWidget {
  CardContadores({super.key, required this.indice, required this.contador});
  int indice;
  ContadoresModel contador;

  List<Color> cores = [
    const Color.fromRGBO(230, 26, 90, 1),
    const Color.fromRGBO(255, 186, 9, 1),
    const Color.fromRGBO(0, 139, 124, 1)
  ];
  double x = 0;

  double y = 1;

  double z = 0;

  Tween animacao = Tween(begin: 0, end: 500);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromRGBO(0, 0, 0, 1),
      color: cores[indice % 3],
      elevation: 10,
      child: InkWell(
        child: Center(
          child: Text(
            contador.nome,
            style: const TextStyle(
                color: material.Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Inter'),
          ),
        ),
        onTap: () {
          Hero(
            tag: 'hero-container-$indice',
            child: Navegacao.telaLogin(
              context: context,
              indice: indice,
              contador: contador,
              cor: cores[indice % 3]));
        },
      ),
    );
  }
}
