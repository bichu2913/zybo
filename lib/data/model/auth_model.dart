import 'package:zybo/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({required String otp, required String token, required bool user})
      : super(otp: otp, token: token, user: user);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      otp: json['otp'],
      token: json['token']['access'],
      user: json['user'],
    );
  }
}
