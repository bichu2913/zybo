import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zybo/data/repositories/wishlist_repo.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Productlistingres.dart';
import 'package:zybo/data/sources/user_api/response/request/wishlisreq.dart';
import 'package:zybo/data/sources/wishlist_api/response/wishlistres.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo wishlistRepo;
  WishlistCubit({required this.wishlistRepo,}) : super(WishlistInitial());

  Future<void> addWishlist(String productid) async {
    emit(WishlistLoading());
    try {
      final products = await wishlistRepo.getwishlist(Wishlisres(productId: productid));
      emit(WishlistSuccess(products.data));
    } catch (e) {
      log(e.toString());
      emit(WishlistFailure(e.toString()));
    }
  }
  Future<void> getWishlist() async {
    emit(WishlistLoading());
    try {
      final products = await wishlistRepo.getwishlistdata();
      emit(WishlistSuccesss(products.data));
    } catch (e) {
      emit(WishlistFailure(e.toString()));
    }
  }
}
