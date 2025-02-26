import 'package:path_provider/path_provider.dart';

class DocumentManager {

  Future<String> getDocAppDir () async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

}