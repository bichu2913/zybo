import 'package:zybo/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> verifyUser(String phoneNumber);
  Future<AuthEntity> loginRegister(String firstName, String phoneNumber);
}
