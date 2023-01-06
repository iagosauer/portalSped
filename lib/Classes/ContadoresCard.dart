// ignore: file_names
import 'package:flutter/material.dart';
import 'package:portalsped/Classes/navegacao.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/contadores_repository.dart';

class ContadoresCard {
  static createListaContadores(BuildContext context) async {
    List<Widget> lista = [];
    final contadores = await ContadoreRepository.getContadores();

    for (int i = 0; i < contadores.length; i++) {
      lista.add(
        CardContadores(indice: i, contador: contadores[i]).build(context),
      );
    }
    return lista;
  }
}

// ignore: must_be_immutable
class CardContadores extends StatelessWidget {
  CardContadores({super.key, required this.indice, required this.contador});
  final int indice;
  final ContadoresModel contador;

  List<Color> cores = [
    const Color.fromRGBO(230, 26, 90, 1),
    const Color.fromRGBO(255, 186, 9, 1),
    const Color.fromRGBO(0, 139, 124, 1)
  ];

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
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Inter'),
          ),
        ),
        onTap: () {
          Navegacao.telaLogin(
              context: context,
              indice: indice,
              contador: contador,
              cor: cores[indice % 3]);
        },
      ),
    );
  }
}
