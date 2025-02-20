import 'package:zybo/core/resorces/repository_resource.dart';
import 'package:zybo/core/secure_store/secure_store_helper.dart';
import 'package:zybo/data/sources/user_api/response/user_profile.dart';
import 'package:zybo/data/sources/user_api/user_api.dart';

class UserRepo {
  final UserAPI userAPI;
  
  UserRepo({required this.userAPI, });
  final storageService = SecureStorageService();
  

  Future<RepoResource<UserProfile>> getuser() async {
    String? token = await storageService.getToken();
    UserProfile response = await userAPI.fetchUserProfile(token.toString());
    
    return RepoResource(RepoResourceType.NETWORK, response);
  }
 


  }