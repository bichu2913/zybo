import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zybo/data/repositories/home_repo.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Bannerlistingres.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final HomeRepo homeRepo;
  BannerCubit({required this.homeRepo,}) : super(BannerInitial());

   Future<void> getBanner() async {
    emit(BannerLoading());
    try {
      final products = await homeRepo.banners();
      emit(BannerSuccess(products.data));
      
    } catch (e) {
      emit(BannerFailure(e.toString()));
    }
  }
}
