import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotaoLogin extends StatelessWidget {
  TextEditingController controler;
  BotaoLogin({
    Key? key,
    required this.controler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ElevatedButton(
              // ignore: prefer_const_literals_to_create_immutables
              child: const Center(
                child: Text('Entrar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25
                ),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
