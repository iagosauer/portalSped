import 'package:flutter/material.dart';
import 'package:portalsped/Classes/ContadoresCard.dart';
import 'package:portalsped/widgets/appBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar(),
      body: const PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<PaginaInicial> {
  final double padding = 10;
  bool carregando = true;
  List<Widget> contadores = [];

  @override
  void initState() {
    super.initState();
    carregandoListaWidget();
    setState(() {
      carregando = false;
    });
  }

  carregandoListaWidget() async {
    contadores = await ContadoresCard.createListaContadores(context);
  }

  @override
  Widget build(BuildContext context) {
    return carregando
        ? const CircularProgressIndicator()
        : GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.0,
            ),
            children: contadores,
          );
  }
}
