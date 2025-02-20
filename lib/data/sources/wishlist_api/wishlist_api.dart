import 'package:dio/dio.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Productlistingres.dart';
import 'package:zybo/data/sources/user_api/response/request/wishlisreq.dart';
import 'package:zybo/data/sources/wishlist_api/response/wishlistres.dart';

class WishlistAPI {
  final Dio dio;
  WishlistAPI({required this.dio});

   Future<Wishlisreq> wishlist(String token,Wishlisres wishlisres ) async {
    final response = await dio.post(
      '/add-remove-wishlist/',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // Attach JWT Token
        },
      ),
      data: wishlisres.toJson()
    );

    return Wishlisreq.fromJson(response.data);
    
  }
   Future<List<Productlistingres>> wishlistview(String token, ) async {
    final response = await dio.get(
      '/wishlist/',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // Attach JWT Token
        },
      ),
      
    );

    
    return (response.data as List)
        .map((e) => Productlistingres.fromJson(e))
        .toList();
  }
  
  



}