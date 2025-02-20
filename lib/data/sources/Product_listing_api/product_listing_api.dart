
import 'package:dio/dio.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Bannerlistingres.dart';

import 'response/Productlistingres.dart';

class ProductlistingAPI {
  final Dio dio;
  ProductlistingAPI({required this.dio});

  Future<List<Productlistingres>> productlisting(String token) async {
    final response = await dio.get('/products/',
    options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        },
      ),);
    
    return (response.data as List)
        .map((e) => Productlistingres.fromJson(e))
        .toList();
  }

  Future<List<Bannerlistingres>> bannerlisting() async {
    final response = await dio.get('/banners/');
  
    return (response.data as List)
        .map((e) => Bannerlistingres.fromJson(e))
        .toList();
   
  }

}