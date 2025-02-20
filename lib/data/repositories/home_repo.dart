import 'package:zybo/core/resorces/repository_resource.dart';
import 'package:zybo/core/secure_store/secure_store_helper.dart';
import 'package:zybo/data/sources/Product_listing_api/product_listing_api.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Productlistingres.dart';

import '../sources/Product_listing_api/response/Bannerlistingres.dart';

class HomeRepo {
  final ProductlistingAPI productlistingAPI;
  
  HomeRepo({required this.productlistingAPI, });
  final storageService = SecureStorageService();

  

  Future<RepoResource<List<Productlistingres>>> products() async {
    String? token = await storageService.getToken();
    final response = await productlistingAPI.productlisting(token.toString());
    
    return RepoResource(RepoResourceType.NETWORK, response);
  }
  Future<RepoResource<List<Bannerlistingres>>> banners() async {
  final response = await productlistingAPI.bannerlisting();
  return RepoResource(RepoResourceType.NETWORK, response);
}


  


  }