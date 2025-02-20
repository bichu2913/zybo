import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zybo/core/network/api_client.dart';
import 'package:zybo/data/repositories/home_repo.dart';
import 'package:zybo/data/repositories/login_repo.dart';
import 'package:zybo/data/repositories/user_repo.dart';
import 'package:zybo/data/repositories/wishlist_repo.dart';
import 'package:zybo/data/sources/Product_listing_api/product_listing_api.dart';
import 'package:zybo/data/sources/login_api/login_api.dart';
import 'package:zybo/data/sources/user_api/user_api.dart';
import 'package:zybo/data/sources/wishlist_api/wishlist_api.dart';
import 'package:zybo/presentation/cubit/Auth/auth_cubit.dart';
import 'package:zybo/presentation/cubit/banner_listing/banner_cubit.dart';
import 'package:zybo/presentation/cubit/bottomnav/bottom_nav_cubit.dart';
import 'package:zybo/presentation/cubit/product_listing/product_cubit.dart';
import 'package:zybo/presentation/cubit/user/user_cubit.dart';
import 'package:zybo/presentation/cubit/wishlist/wishlist_cubit.dart';

final sl = GetIt.instance;

void setupLocator() async {

   //sl.registerLazySingleton(() => const FlutterSecureStorage());
  

 // sl.registerLazySingleton(() => SecureStoreHelper(sl()));
  sl.registerLazySingleton(() => DioClient());
  

  //cubit
  sl.registerLazySingleton(() => AuthCubit(loginRepo: sl()));
  sl.registerLazySingleton(() => BannerCubit(homeRepo: sl()));
  sl.registerLazySingleton(() => ProductCubit(homeRepo: sl()));
  sl.registerLazySingleton(() => BottomNavCubit());
  sl.registerLazySingleton(() => UserCubit(userRepo: sl()));
  sl.registerLazySingleton(() => WishlistCubit(wishlistRepo: sl()));

  

   //repo
  sl.registerLazySingleton(() => LoginRepo(loginApi: sl()));
  sl.registerLazySingleton(() => HomeRepo(productlistingAPI: sl()));
  sl.registerLazySingleton(() => UserRepo(userAPI: sl()));
  sl.registerLazySingleton(() => WishlistRepo(wishlistAPI: sl()));
  


  //network
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);
  sl.registerLazySingleton(() => LoginAPI(dio: sl()));
  sl.registerLazySingleton(() => ProductlistingAPI(dio: sl()));
  sl.registerLazySingleton(() => UserAPI(dio: sl()));
  sl.registerLazySingleton(() => WishlistAPI(dio: sl()));
  


 
}
