import 'package:zybo/core/resorces/repository_resource.dart';
import 'package:zybo/core/secure_store/secure_store_helper.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Productlistingres.dart';
import 'package:zybo/data/sources/user_api/response/request/wishlisreq.dart';
import 'package:zybo/data/sources/wishlist_api/response/wishlistres.dart';
import 'package:zybo/data/sources/wishlist_api/wishlist_api.dart';

class WishlistRepo {
  final WishlistAPI wishlistAPI;
  
  WishlistRepo({required this.wishlistAPI, });
  final storageService = SecureStorageService();
  

  Future<RepoResource<Wishlisreq>>getwishlist(Wishlisres wishlisres) async {
    String? token = await storageService.getToken();
    final response = await wishlistAPI.wishlist(token.toString(),wishlisres);
    
    return RepoResource(RepoResourceType.NETWORK, response);
  }

  Future<RepoResource<List<Productlistingres>>>getwishlistdata() async {
    String? token = await storageService.getToken();
    final response = await wishlistAPI.wishlistview(token.toString());
    
    return RepoResource(RepoResourceType.NETWORK, response);
  }
 

  
 


  }