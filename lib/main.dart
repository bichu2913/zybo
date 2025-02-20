import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo/core/di/injection.dart';
import 'package:zybo/presentation/cubit/Auth/auth_cubit.dart';
import 'package:zybo/presentation/cubit/banner_listing/banner_cubit.dart';
import 'package:zybo/presentation/cubit/bottomnav/bottom_nav_cubit.dart';
import 'package:zybo/presentation/cubit/product_listing/product_cubit.dart';
import 'package:zybo/presentation/cubit/user/user_cubit.dart';
import 'package:zybo/presentation/cubit/wishlist/wishlist_cubit.dart';
import 'package:zybo/screens/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
        BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>(),
        ),
        BlocProvider<BannerCubit>(
          create: (context) => sl<BannerCubit>(),
        ),
        BlocProvider<ProductCubit>(
          create: (context) => sl<ProductCubit>(),
        ),
        BlocProvider<BottomNavCubit>(
          create: (context) => sl<BottomNavCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => sl<UserCubit>(),
        ),
         BlocProvider<WishlistCubit>(
          create: (context) => sl<WishlistCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  LoginScreen(),
      ),
    );
  }
}

