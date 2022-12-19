import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldPassword extends StatelessWidget {
  TextEditingController controler;
  CustomTextFieldPassword({
    Key? key,
    required this.controler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Card(
            child: TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
              controller: controler,
            ),
          ),
        ),
      ],
    );
  }
}
