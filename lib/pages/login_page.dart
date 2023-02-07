import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controler = TextEditingController(text: '');

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          height: 400,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/imagens/icone.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Usuário'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                controller: controler,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Senha'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
