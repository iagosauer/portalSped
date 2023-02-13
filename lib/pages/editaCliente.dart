import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/contadores_repository.dart';
import 'package:portalsped/Widgets/Text.dart';
import 'package:portalsped/Widgets/appBar.dart';
import 'package:portalsped/Widgets/drop_down_button.dart';
import 'package:portalsped/Widgets/janela_Dialog.dart';

class EditaCliente extends StatefulWidget {
  EditaCliente({super.key, required this.args});
   ArgumentsEditar args;


  @override
  State<EditaCliente> createState() => _EditaClienteState();
}

class _EditaClienteState extends State<EditaCliente> {
  final controlerSenha = TextEditingController(text: '');
  final controlerUsuario = TextEditingController(text: '');
  final controlerPastaEscrito = TextEditingController(text: '');
  final controlerPasta = ValueNotifier<String>('');
  final controlerhabilitaComboBox = ValueNotifier(true);
  ContadoresModel? contador = ContadoresModel(nome: '');
  ContadoresModel? contadorAdm = ContadoresModel(nome: '');
  late List<String> pastas = [];
  String dropDownValue = '';
  late bool contadorExistente = true;
  bool carregando = true;
  String textoBotao = 'CADASTRAR';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  void _init() async {
    pastas = await ContadoresRepository().fetchPastas();
    contador = widget.args.contador;
    contadorAdm = widget.args.contadorAdm;
    contador == null
        ? contadorExistente = false
        : contadorExistente = true;
    if (contadorExistente) {
      controlerUsuario.text = contador!.nome;
      controlerSenha.text = contador!.senha!;
      controlerPasta.value = contador!.pasta!;
      textoBotao = 'ATUALIZAR';
    }

    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return carregando
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: Appbar.appBarManutencao(context),
            body: Center(
              child: Card(
                shadowColor: Colors.black,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  width: 400,
                  child: Column(children: [
                    TextFormat(texto: 'Nome do Usuário:'),
                    TextFormField(
                      enabled: !contadorExistente,
                      controller: controlerUsuario,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Usuário'),
                      ),
                    ),
                    const Divider(height: 20),
                    TextFormat(texto: 'Pasta:'),
                    ValueListenableBuilder<bool>(
                      valueListenable: controlerhabilitaComboBox,
                     builder: (context, value, _) {
                      return CustomDropDownButtonDialogForm(
                        list: pastas,
                        habilitado: value,
                        controler: controlerPasta);
                     },),
                    const Divider(height: 20),
                    CheckboxListTile(
                        title: const Text('Adicionar nova pasta'),
                        value: controlerhabilitaComboBox.value,
                        onChanged: (value) {
                          setState(() {
                            controlerhabilitaComboBox.value =
                                !controlerhabilitaComboBox.value;
                          });
                        }),
                    const Divider(height: 20),
                    TextFormat(texto: 'Digite o nome da pasta:'),
                    TextFormField(
                      enabled: !controlerhabilitaComboBox.value,
                      controller: controlerPastaEscrito,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Pasta'),
                      ),
                    ),
                      const Divider(height: 20),
                    TextFormat(texto: 'Senha:'),
                    TextFormField(
                      controller: controlerSenha,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Senha'),
                      ),
                    ),
                      const Divider(height: 20),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _botaoSalvar(controlerUsuario.text, controlerSenha.text,
                              controlerPasta.value, controlerPastaEscrito.text);
                        },
                        child: Text(textoBotao),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          );
  }

  void _botaoSalvar(
      String usuario, String senha, String pasta, String pastaEscrito) async {
    String nomePasta = '';
    nomePasta = controlerhabilitaComboBox.value ? pasta : pastaEscrito;

    if (usuario.length < 4) {
      JanelaDialog(mensagem: 'Nome de usuario inválido', mensagemTrue: 'Ok');
    } else if (senha.length < 3) {
      JanelaDialog(
          mensagem: 'Coloque pelo menos 3 caracteres para a senha',
          mensagemTrue: 'Ok');
    } else if (pasta.length < 4) {
      JanelaDialog(mensagem: 'Nome da pasta inválida', mensagemTrue: 'Ok');
    } else {
      nomePasta = nomePasta.replaceAll(' ', '_');
      if (contadorExistente) {
        bool aux = await ContadoresRepository.updateContador(usuario, senha, nomePasta);
        if (aux) {
          if(!pastas.contains(nomePasta))
          {

          }
          await JanelaDialog(mensagem: 'Alterado Com Sucesso', mensagemTrue: 'Ok').build(context);
          Navigator.of(context).pushNamed('/manutencao',
            arguments: contadorAdm);
        }
      }
    }
  }
}

class ArgumentsEditar {
  final ContadoresModel contador;
  final ContadoresModel contadorAdm;

  ArgumentsEditar(this.contador, this.contadorAdm);
}