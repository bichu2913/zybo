part of 'wishlist_cubit.dart';


abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistSuccess extends WishlistState  {
  
  final Wishlisreq productData;

  WishlistSuccess(this.productData);
}
class WishlistSuccesss extends WishlistState  {
  
  final List<Productlistingres> productData;

  WishlistSuccesss(this.productData);
}


class WishlistFailure extends WishlistState {
  final String error;
  WishlistFailure(this.error);
}