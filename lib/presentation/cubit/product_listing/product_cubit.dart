import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zybo/data/repositories/home_repo.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Productlistingres.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeRepo homeRepo;
  ProductCubit({required this.homeRepo,}) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    try {
      final products = await homeRepo.products();
      emit(ProductSuccess(products.data));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}

