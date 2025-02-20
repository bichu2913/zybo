import 'package:zybo/core/resorces/repository_resource.dart';
import 'package:zybo/data/sources/login_api/login_api.dart';
import 'package:zybo/data/sources/login_api/request/Regreq.dart';
import 'package:zybo/data/sources/login_api/request/loginreq.dart';
import 'package:zybo/data/sources/login_api/response/Regres.dart';
import 'package:zybo/data/sources/login_api/response/loginres.dart';

class LoginRepo {
  final LoginAPI loginApi;
  
  LoginRepo({required this.loginApi, });

  

  Future<RepoResource<Loginres>> login(Loginreq userLoginReq) async {
    Loginres response = await loginApi.login(userLoginReq);
    
    return RepoResource(RepoResourceType.NETWORK, response);
  }
  Future<RepoResource<Regres>> register(Regreq userLoginReq) async {
    Regres response = await loginApi.register(userLoginReq);
    
    return RepoResource(RepoResourceType.NETWORK, response);
  }


  }


