
import 'package:flutter/material.dart';


class ErrorPage extends StatefulWidget {
  const ErrorPage({
    super.key,
    required this.exception
  });
  final Object exception;

  @override
  State<ErrorPage> createState() => _MyErrorPageState();
}

class _MyErrorPageState extends State<ErrorPage> {

  final double padding = 10;



    @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Erro: ${widget.exception}'),)
    );
  }
}

