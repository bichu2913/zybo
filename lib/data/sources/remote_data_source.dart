

import 'package:zybo/core/network/api_client.dart';
import 'package:zybo/core/network/api_constants.dart';
import 'package:zybo/data/model/auth_model.dart';

abstract class RemoteDataSource {
  Future<AuthModel> verifyUser(String phoneNumber);
  Future<AuthModel> loginRegister(String firstName, String phoneNumber);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final DioClient apiClient;

  RemoteDataSourceImpl(this.apiClient);

  @override
  Future<AuthModel> verifyUser(String phoneNumber) async {
    final response = await apiClient.post(ApiConstants.verifyUser, {"phone_number": phoneNumber});
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> loginRegister(String firstName, String phoneNumber) async {
    final response = await apiClient.post(ApiConstants.loginRegister, {
      "first_name": firstName,
      "phone_number": phoneNumber,
    });
    return AuthModel.fromJson(response);
  }
}
