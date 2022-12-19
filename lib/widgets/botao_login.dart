import 'dart:developer';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotaoLogin extends StatefulWidget {
  TextEditingController controler;
  final Size size;
  BotaoLogin({Key? key, required this.controler, required this.size})
      : super(key: key);

  @override
  State<BotaoLogin> createState() => _BotaoLoginState();
}

class _BotaoLoginState extends State<BotaoLogin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(elevation: MaterialStateProperty.all(10)),
                // ignore: prefer_const_literals_to_create_immutables
                child: Center(
                  child: Text(
                    'Entrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: widget.size.height * 0.04),
                  ),
                ),
                onPressed: () {
                  dispose();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
