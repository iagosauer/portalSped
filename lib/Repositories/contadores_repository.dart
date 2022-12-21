import 'package:portalsped/Classes/portal_ftp.dart';
import 'package:portalsped/Classes/portal_ftp.dart' as portal_ftp;
import 'package:portalsped/Models/contadores_model.dart';

class ContadoreRepository {
  static Future<List<ContadoresModel>> getContadores() async {
    List<ContadoresModel> contadores = [];
    final ftpExplorer = FTPExplorer(
      url: 'portalsoft.sytes.net',
      user: 'portal_ftp',
      pass: 'portal3694',
    );
    await ftpExplorer.connect();
    try {
      final directories = await ftpExplorer.listDirectory(directory: 'SPED');
      for (var dir in directories) {
        contadores.add(ContadoresModel(nome: dir));
        portal_ftp.log(dir);
      }
      return contadores;
    } catch (e) {
      throw Exception(e);
    } finally {
      await ftpExplorer.disconect();
    }
  }
}
