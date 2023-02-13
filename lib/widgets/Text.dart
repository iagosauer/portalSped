import 'package:flutter/material.dart';

class TextFormat extends StatelessWidget {
  TextFormat({required this.texto});
  final String texto;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          textAlign: TextAlign.left,
          texto,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
