import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo/presentation/widget/commonwidget.dart';
import 'package:zybo/screens/homescreen.dart';

import '../presentation/cubit/wishlist/wishlist_cubit.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WishlistCubit>(context).getWishlist();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          

          return BlocBuilder<WishlistCubit, WishlistState>(
  builder: (context, state) {
    if (state is WishlistFailure) {
      return Center(child: Text(state.error));
    } else if (state is WishlistLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is WishlistSuccesss) {
      

      

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
                   Text(
                        "Wishlist",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                  SizedBox(height: 40),
            GridView.builder(
              shrinkWrap: true,
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: state.productData.length, 
              itemBuilder: (context, index) {
                return Expanded(child: ProductCard(product: state.productData[index]));
              },
            ),
          ],
        ),
      );
    }
    return SizedBox();
  },
);

        },
      ),
    );
  }
}

