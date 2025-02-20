import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Save JWT Token
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt_token', value: token);
  }

  // Retrieve JWT Token
  Future<String?> getToken() async {
    return await _storage.read(key: 'jwt_token');
  }

  // Delete JWT Token (For Logout)
  Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt_token');
  }
}
