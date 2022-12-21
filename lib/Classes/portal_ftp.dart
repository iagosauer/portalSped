import 'package:ftpconnect/ftpconnect.dart';

class FTPExplorer {
  final String url;
  final String user;
  final String pass;

  late FTPConnect ftpConnect;

  FTPExplorer({
    required this.url,
    required this.user,
    required this.pass,
  }) {
    ftpConnect = FTPConnect(url, user: user, pass: pass, debug: true);
    ftpConnect.listCommand = ListCommand.LIST;
  }

  connect() async {
    log('Aguarde, conectando no FTP...');
    await ftpConnect.connect();
  }

  disconect() async {
    log('Aguarde, desconectando do FTP...');
    await ftpConnect.disconnect();
  }

  Future<List<String>> listDirectory({required String directory}) async {
    final list = <String>[];
    try {
      await ftpConnect.changeDirectory(directory);
      final directories = await ftpConnect.listDirectoryContentOnlyNames();
      for (var dir in directories) {
        list.add(dir);
      }
      return list;
    } catch (e) {
      throw Exception(e);
    }
  }
}

Future<void> log(String log) async {
  print(log);
  await Future.delayed(Duration(seconds: 1));
}
