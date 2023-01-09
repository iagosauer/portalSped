

import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Models/documentos_model.dart';

class AdicionaValores{

  static getContadores()
  {
    List<ContadoresModel> contadores = [];
    ContadoresModel conde = ContadoresModel(nome: 'Escritório Conde',
    clientes: getClientes(1)
     );
    ContadoresModel jupiter = ContadoresModel(nome: 'Escritório Jupiter',
    clientes: getClientes(2)
     );
     ContadoresModel escritorioFatimaDoSul = ContadoresModel(nome: 'Escritório Fatima do Sul',
    clientes: getClientes(3)
     );

     contadores.add(conde);
     contadores.add(jupiter);
     contadores.add(escritorioFatimaDoSul);

  return contadores;
  }

  static getClientes(int indice)
  {
    List<ClientesModel> clientes = [];
    if (indice == 1)
    {
      ClientesModel mercadoBomDia = ClientesModel(nome: 'Mercado Bom Dia');
      mercadoBomDia.filhos = getDocumentos(mercadoBomDia);
      ClientesModel mercadoBoatarde = ClientesModel(nome: 'Mercado Boa Tarde');
      mercadoBoatarde.filhos = getDocumentos(mercadoBoatarde);
      ClientesModel mercadoBoaNoite = ClientesModel(nome: 'Mercado Boa Noite');
      mercadoBoaNoite.filhos = getDocumentos(mercadoBoaNoite);
      clientes.add(mercadoBomDia);
      clientes.add(mercadoBoatarde);
      clientes.add(mercadoBoaNoite);
    }
    if(indice == 2)
    {
      ClientesModel yudiSom = ClientesModel(nome: 'Yudison');
      yudiSom.filhos = getDocumentos(yudiSom);
      ClientesModel maisMoveis = ClientesModel(nome: 'Mais Móveis');
      maisMoveis.filhos = getDocumentos(maisMoveis);
      ClientesModel lojaDasFabricas = ClientesModel(nome: 'Loja das Fábricas');
      lojaDasFabricas.filhos = getDocumentos(lojaDasFabricas);
      clientes.add(yudiSom);
      clientes.add(maisMoveis);
      clientes.add(lojaDasFabricas);
    }
    if(indice == 3){
      ClientesModel pesqueiroFatimaDoSul = ClientesModel(nome: 'Pesqueiro Fatima Do Sul');
      pesqueiroFatimaDoSul.filhos = getDocumentos(pesqueiroFatimaDoSul);
      ClientesModel bebidasFavoDeMel = ClientesModel(nome: 'Bebidas Favo de Mel');
      bebidasFavoDeMel.filhos = getDocumentos(bebidasFavoDeMel);
      ClientesModel clinicaOdonto = ClientesModel(nome: 'Clinica Odonto');
      clinicaOdonto.filhos = getDocumentos(clinicaOdonto);
      clientes.add(pesqueiroFatimaDoSul);
      clientes.add(bebidasFavoDeMel);
      clientes.add(clinicaOdonto);
    }
    /*
    clientes.add(ClientesModel(nome: 'Exemplo 01',
    filhos: []));
    clientes.add(ClientesModel(nome: 'Exemplo 02',
    filhos: []));
        clientes.add(ClientesModel(nome: 'Exemplo 03',
    filhos: []));
        clientes.add(ClientesModel(nome: 'Exemplo 04',
    filhos: []));
        clientes.add(ClientesModel(nome: 'Exemplo 05',
    filhos: []));
        clientes.add(ClientesModel(nome: 'Exemplo 06',
    filhos: []));
*/
    return clientes;
  }

   static getDocumentos(Object pai)
  {
    List<DocumentosModel> documentos = [];
    DocumentosModel anoVinteEDois = DocumentosModel(nome: '2022', tipoDocumento: TipoDocumento.pasta);
    anoVinteEDois.filhos = getDocumentosVinteEDois(pai, anoVinteEDois);
    DocumentosModel anoVinteETres = DocumentosModel(nome: '2023', tipoDocumento: TipoDocumento.pasta);
    anoVinteETres.filhos = getDocumentosVinteETres(pai, anoVinteETres);
    documentos.add(anoVinteEDois);
    documentos.add(anoVinteETres);
    return documentos;
  }

  static getDocumentosVinteEDois(Object avo, Object pai)
  {
    List<DocumentosModel> documentos = [];
    DocumentosModel back = DocumentosModel(nome: 'BACK', 
    pai: avo, tipoDocumento: TipoDocumento.back);

    DocumentosModel novembro = DocumentosModel(nome: 'NOVEMBRO', tipoDocumento: TipoDocumento.pasta);
    novembro.filhos = getDocumentosMes(pai, novembro);
    DocumentosModel dezembro = DocumentosModel(nome: 'DEZEMBRO', tipoDocumento: TipoDocumento.pasta);
    dezembro.filhos = getDocumentosMes(pai, dezembro);
    documentos.add(back);
    documentos.add(novembro);
    documentos.add(dezembro);
    return documentos;
  }

  static getDocumentosVinteETres(Object avo, Object pai)
  {
    List<DocumentosModel> documentos = [];
    DocumentosModel back = DocumentosModel(nome: 'BACK',
    pai: avo, tipoDocumento: TipoDocumento.back);

    DocumentosModel janeiro = DocumentosModel(nome: 'JANEIRO', tipoDocumento: TipoDocumento.pasta);
    janeiro.filhos = getDocumentosMes(pai, janeiro);
    DocumentosModel fevereiro = DocumentosModel(nome: 'FEVEREIRO', tipoDocumento: TipoDocumento.pasta);
    fevereiro.filhos = getDocumentosMes(pai, fevereiro);
    documentos.add(back);
    documentos.add(janeiro);
    documentos.add(fevereiro);
    return documentos;
  }

  static getDocumentosMes(Object avo, Object pai)
  {

    List<DocumentosModel> documentos = [];

      DocumentosModel back = DocumentosModel(nome: 'BACK',
      pai: avo,
       tipoDocumento: TipoDocumento.back);
      DocumentosModel nfe = DocumentosModel(nome: 'NFe', tipoDocumento: TipoDocumento.pasta);
      nfe.filhos = getArquivosNFe(pai as DocumentosModel, nfe);
      DocumentosModel nfc = DocumentosModel(nome: 'NFc', tipoDocumento: TipoDocumento.pasta);
      nfc.filhos = getArquivosNFC(pai, nfc);
     documentos.add(back);
     documentos.add(nfe);
     documentos.add(nfc);
     return documentos;

  }

  static getArquivosNFC(DocumentosModel avo, DocumentosModel pai)
  {
    List<DocumentosModel> documentos = [];
    documentos.add(
      DocumentosModel(nome: 'BACK',pai: avo, tipoDocumento: TipoDocumento.back)
    );
    for (int i=0; i < 10; i++)
    {
      documentos.add(DocumentosModel(nome: 'NFC ${i+1} do mes ${avo.nome}',
       tipoDocumento: TipoDocumento.documento));
    }
    return documentos;
  }

  static getArquivosNFe(DocumentosModel avo, DocumentosModel pai)
  {
    List<DocumentosModel> documentos = [];
    documentos.add(
      DocumentosModel(nome: 'BACK', pai: avo, tipoDocumento: TipoDocumento.back)
    );
    for (int i=0; i < 10; i++)
    {
      documentos.add(DocumentosModel(nome: 'NFe ${i+1} do mes ${avo.nome}',
       tipoDocumento: TipoDocumento.documento));
    }
    return documentos;

  }


}