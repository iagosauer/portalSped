import 'package:flutter/material.dart';
import 'package:portalsped/Classes/Navegacao.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/usuario_repository.dart';
import 'package:portalsped/Widgets/appBar.dart';
import 'package:portalsped/Widgets/janela_Dialog.dart';

class TrocarSenha extends StatefulWidget {
  const TrocarSenha({
    super.key,
    required this.contador
  });
  final ContadoresModel contador;
  
  @override
  State<TrocarSenha> createState() => _LoginPageState();
}

class _LoginPageState extends State<TrocarSenha> {
  bool obscureTextSenhaAtual = true;
  bool obscureTextSenhaUm = true;
  bool obscureTextSenhaDois = true;
  final controlerSenhaAtual = TextEditingController(text: '');
  final controlerSenhaNovoUm = TextEditingController(text: '');
  final controlerSenhaNovoDois = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Appbar.appBar(widget.contador, context),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          height: 400,
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
                obscureText: obscureTextSenhaAtual,
                controller: controlerSenhaAtual,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Digite a sua senha atual'),
                  suffixIcon: InkWell(
                    child: GestureDetector(
                      child: Icon(obscureTextSenhaAtual ? Icons.visibility_off
                      : Icons.visibility
                      , color: Colors.black),
                      onTap: (){
                        setState(() {
                          obscureTextSenhaAtual = !obscureTextSenhaAtual;
                        });
                      },),
                  )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: obscureTextSenhaUm,
                controller: controlerSenhaNovoUm,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Digite nova senha'),
                  suffixIcon: InkWell(
                    child: GestureDetector(
                      child: Icon(obscureTextSenhaUm ? Icons.visibility_off
                      : Icons.visibility
                      , color: Colors.black,),
                      onTap: (){
                        setState(() {
                          obscureTextSenhaUm = !obscureTextSenhaUm;
                        });
                      },),
                  )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: obscureTextSenhaDois,
                controller: controlerSenhaNovoDois,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text('Repita a nova senha'),
                  suffixIcon: InkWell(
                    child: GestureDetector(
                      child: Icon(obscureTextSenhaDois ? Icons.visibility_off
                      : Icons.visibility
                      , color: Colors.black,),
                      onTap: (){
                        setState(() {
                          obscureTextSenhaDois = !obscureTextSenhaDois;
                        });
                      },),
                  )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _trocaSenha(controlerSenhaAtual.text, 
                    controlerSenhaNovoUm.text,
                    controlerSenhaNovoDois.text);
                  },
                  child: const Text('Mudar senha'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _trocaSenha(String senhaAtual, String senhaUm, String senhaDois) async
  {
    if(senhaUm.compareTo(senhaDois) == 0)
    {
      if(senhaUm.length > 2)
      {
        bool aux = await UsuarioRepository().TrocaSenha(widget.contador.nome, senhaAtual, senhaUm, context);
        if(aux)
        {
          await JanelaDialog(mensagem:'Senha Atualizada com Sucesso!', mensagemTrue: 'OK')
          .build(context);
          Navigator.of(context).pushNamed('/',);
        }
      }
      else
      {
      JanelaDialog(mensagem:'A nova senha deve conter mais que 2 caracteres!', mensagemTrue: 'OK')
      .build(context);
      }
    }
    else
    {
      JanelaDialog(mensagem:'As duas senhas digitadas acima estão diferentes!', mensagemTrue: 'OK')
      .build(context);
    }
  }

}
