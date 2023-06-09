import 'package:flutter/material.dart';
import 'package:portalsped/Repositories/usuario_repository.dart';
import 'package:portalsped/Widgets/janela_Dialog.dart';
import 'package:portalsped/pages/clientes_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences prefs;
  var check = false;
  bool carregando = false;
  final controlerSenha = TextEditingController(text: '');
  final controlerUsuario = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  _init() async {
    prefs = await SharedPreferences.getInstance();
    controlerUsuario.text = prefs.getString('user') ?? '';
    controlerSenha.text = prefs.getString('pass') ?? '';
    check = prefs.getBool('remember') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: 400,
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
                controller: controlerUsuario,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Usuário'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onFieldSubmitted: (value) =>
                    _botaoLogin(controlerUsuario.text, controlerSenha.text),
                obscureText: true,
                controller: controlerSenha,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Senha'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CheckboxListTile(
                  title: const Text('Lembrar'),
                  value: check,
                  onChanged: (value) {
                    setState(() {
                      check = !check;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (check) {
                      prefs.setString('user', controlerUsuario.text);
                      prefs.setString('pass', controlerSenha.text);
                      prefs.setBool('remember', check);
                    } else {
                      prefs.remove('user');
                      prefs.remove('pass');
                      prefs.remove('remember');
                    }
                    _botaoLogin(controlerUsuario.text, controlerSenha.text);
                  },
                  child: const Text('Entrar'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              carregando
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center()
            ],
          ),
        ),
      ),
    );
  }

  _botaoLogin(String usuario, String senha) async {
    setState(() {
      carregando = true;
    });
    var contador =
        await UsuarioRepository().verificaLogin(usuario, senha, context);
    if (contador.nome.compareTo('') != 0) {
      if (contador.nome.compareTo('portalAdmin') == 0) {
        Navigator.of(context).pushNamed('/manutencao', arguments: contador);
      } else {
        Navigator.of(context).pushNamed('/clientes',
            arguments: ArgumentosClientesPage(contador, false));
      }
    } else {
      // ignore: use_build_context_synchronously
      JanelaDialog(mensagem: 'Usuário ou senha incorreta', mensagemTrue: 'OK')
          .build(context);
    }
    setState(() {
      carregando = false;
    });
  }
}
