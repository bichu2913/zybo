import 'package:dio/dio.dart';
import 'package:zybo/data/sources/login_api/request/Regreq.dart';
import 'package:zybo/data/sources/login_api/request/loginreq.dart';
import 'package:zybo/data/sources/login_api/response/Regres.dart';
import 'package:zybo/data/sources/login_api/response/loginres.dart';

class LoginAPI {
  final Dio dio;
  LoginAPI({required this.dio});

  Future<Loginres> login(Loginreq userLoginReq) async {
    final response = await dio.post('/verify/', data: userLoginReq.toJson());
    return Loginres.fromJson(response.data);
  }
  Future<Regres> register(Regreq userLoginReq) async {
    final response = await dio.post('/login-register/', data: userLoginReq.toJson());
    return Regres.fromJson(response.data);
  }

}