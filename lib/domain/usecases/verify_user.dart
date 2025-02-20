import 'package:zybo/domain/entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class VerifyUser {
  final AuthRepository repository;

  VerifyUser(this.repository);

  Future<AuthEntity> call(String phoneNumber) async {
    return await repository.verifyUser(phoneNumber);
  }
}
