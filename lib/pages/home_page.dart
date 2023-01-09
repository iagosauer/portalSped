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

  final double padding = 10;
  bool carregando = true;
  List<Widget> contadores = [];

  carregandoListaWidget() async {
    contadores = await ContadoresCard.createListaContadores(context);
    setState(() {
      carregando = false;
    });
  }

    @override
  void initState() {
    super.initState();
    carregandoListaWidget();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: Appbar.appBar(),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.0,
              ),
              children: contadores,
            ),
    );
  }
}

