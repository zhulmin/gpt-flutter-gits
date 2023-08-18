import 'package:get_storage/get_storage.dart';

class StorageY{
  static Future setup() async {
    await GetStorage.init();
  }

  static String? getToken() {
    return '';
  }
}
