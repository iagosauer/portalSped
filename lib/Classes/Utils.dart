import 'package:flutter/material.dart';
class Utils{
  static String FormataTextoQuebraDeLinhas(String cliente, int numeroCaracteres)
  {
    String retorno = '';
    for(int i = 0; i<cliente.length; i++)
    {
      if((i%numeroCaracteres == 0)&& (i!=0))
      {
        retorno = '$retorno\n';
      }
      retorno = retorno + cliente[i];
    }
    return retorno;
  }

  static int numerosDeLinhasTotal(List<String> lista, int numeroCaracteres)
  {
    int retorno = 0;
    int aux = lista[0].length;

    for(String valor in lista)
    {
      if(valor.length > aux)
      {
        aux = valor.length;
        retorno = (aux/numeroCaracteres).ceil().toInt();
      }
    }

    return retorno;
  }


  static int numeroBarrasString(String valor) {
    int retorno = 0;
    for (int i = 0; i < valor.length; i++) {
      valor[i] == '/' ? retorno++ : null;
    }
    return retorno;
  }

  static String stringPai(String valor)
  {
    int x = valor.lastIndexOf('/');
    String retorno = valor.substring(0,x);
    return retorno;
  }

}
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}