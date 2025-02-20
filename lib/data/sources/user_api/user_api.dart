import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zybo/data/sources/user_api/response/user_profile.dart';



class UserAPI {
  final Dio dio;
  UserAPI({required this.dio});

   Future<UserProfile> fetchUserProfile(String token) async {
    log('Token: $token.'); // Ensure it's not null or empty

    final response = await dio.get(
      '/user-data/',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        },
      ),
    );

    return UserProfile.fromJson(response.data);
  }



}