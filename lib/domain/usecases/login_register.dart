import 'package:zybo/domain/entities/auth_entity.dart';
import 'package:zybo/domain/repositories/auth_repository.dart';

class LoginRegister {
  final AuthRepository repository;

  LoginRegister(this.repository);

  Future<AuthEntity> call(String firstName, String phoneNumber) async {
    return await repository.loginRegister(firstName, phoneNumber);
  }
}
