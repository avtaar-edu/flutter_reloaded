import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = FlutterSecureStorage();

  SecureStorage._instantiate();

  static final SecureStorage instance = SecureStorage._instantiate();

  Future <void> delete(String key)async {
   await storage.delete(key: key);
  }

 Future<void> write(String key, String value) async{
   await storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async{
    return await storage.read(key: key);
  }
}