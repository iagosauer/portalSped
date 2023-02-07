import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portalsped/Classes/MyCustomBehavior.dart';
import 'package:portalsped/Classes/Utils.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/pages/clientes_page.dart';
import 'package:portalsped/pages/login_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Portal Arquivos SPED',
      theme: ThemeData(
        primarySwatch: buildMaterialColor(
          const Color.fromRGBO(13, 62, 178, 1),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/cliente': (context) => ClientesPage(
              contador: ModalRoute.of(context)!.settings as ContadoresModel,
            ),
      },
    );
  }
}
