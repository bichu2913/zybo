part of 'product_cubit.dart';


abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState  {
  
  final List<Productlistingres> productData;

  ProductSuccess(this.productData);
}


class ProductFailure extends ProductState {
  final String error;
  ProductFailure(this.error);
}
