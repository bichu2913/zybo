
import 'package:zybo/data/sources/remote_data_source.dart';
import 'package:zybo/domain/entities/auth_entity.dart';
import 'package:zybo/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthEntity> verifyUser(String phoneNumber) async {
    return await remoteDataSource.verifyUser(phoneNumber);
  }

  @override
  Future<AuthEntity> loginRegister(String firstName, String phoneNumber) async {
    return await remoteDataSource.loginRegister(firstName, phoneNumber);
  }
}
