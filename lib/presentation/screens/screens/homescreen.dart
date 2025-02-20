import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Bannerlistingres.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Productlistingres.dart';
import 'package:zybo/data/sources/wishlist_api/response/wishlistres.dart';
import 'package:zybo/presentation/cubit/banner_listing/banner_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zybo/presentation/cubit/bottomnav/bottom_nav_cubit.dart';
import 'package:zybo/presentation/cubit/product_listing/product_cubit.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zybo/presentation/cubit/user/user_cubit.dart';
import 'package:zybo/presentation/cubit/wishlist/wishlist_cubit.dart';
import 'package:zybo/screens/home.dart';
import 'package:zybo/screens/profilescreen.dart';
import 'package:zybo/screens/wishlistscreen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BannerCubit>(context).getBanner();
    BlocProvider.of<ProductCubit>(context).getProducts();
    BlocProvider.of<WishlistCubit>(context).getWishlist();
    BlocProvider.of<UserCubit>(context).getuser();

    return BlocProvider(
      create: (context) => BottomNavCubit(), // Provide the BottomNavCubit
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return Container(
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.all(Radius.circular(20),),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: GNav(
                  
                  color: Colors.white,
                  activeColor: Colors.purple,
                  tabBackgroundColor: Colors.purple.withOpacity(0.2),
                  gap: 8,
                  padding: EdgeInsets.all(12),
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    context.read<BottomNavCubit>().changeTab(index);
                    
                  },
                  tabs: [
                    GButton(icon: Icons.home,text: 'Home'),
                    GButton(icon: Icons.favorite_border, text: 'Favorites'),
                    GButton(icon: Icons.person_outline, text: 'Profile'),
                  ],
                ),
              ),
            );
          },
        ),
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return IndexedStack(
              index: selectedIndex,
              children: [
                Home(), // Home tab
                WishlistScreen(), 
                ProfileScreen(), 
              ],
            );
          },
        ),
      ),
    );
  }

  
}






