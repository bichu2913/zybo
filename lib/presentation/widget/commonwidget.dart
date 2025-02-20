import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo/data/sources/Product_listing_api/response/Productlistingres.dart';
import 'package:zybo/presentation/cubit/banner_listing/banner_cubit.dart';
import 'package:zybo/presentation/cubit/product_listing/product_cubit.dart';
import 'package:zybo/presentation/cubit/wishlist/wishlist_cubit.dart';

class BannerAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double bannerHeight = screenHeight * 0.2;
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        if (state is BannerSuccess) {
          return CarouselSlider(
            options: CarouselOptions(
              height: bannerHeight,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: state.data.map((banner) {
              log(banner.image?? ''); // Log the image URL
              // `data` is now a list
              return Container(
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image:
                        NetworkImage(banner.image ?? ''), // Handle null safely
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          );
        } else if (state is BannerFailure) {
          log(state.error);
          return Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                state.error,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else {
          return Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Loading...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
      },
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductFailure) {
          return Center(child: Text('Error loading products'));
        } else if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemCount: state.productData.length,
            itemBuilder: (context, index) {
              return ProductCard(product: state.productData[index]);
            },
          );
        }
        return SizedBox();
      },
    );
  }
}



class ProductCard extends StatefulWidget {
  final Productlistingres product;

  const ProductCard({super.key, required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false; // Local state for favorite

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.inWishlist ?? false; // Initialize from product data
  }

  void toggleWishlist() {
    setState(() {
      isFavorite = !isFavorite; // Toggle color
    });

    // Call Cubit method
    context.read<WishlistCubit>().addWishlist(widget.product.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70, // Background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Stack(
                children: [
                  Image.network(
                    widget.product.featuredImage ?? 'https://via.placeholder.com/150',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: toggleWishlist,
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite ? Colors.purple : Colors.white, // Change color dynamically
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '₹${widget.product.salePrice ?? 800}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '₹${widget.product.discount ?? 599}',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.name ?? 'Product Name',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Text(
                          '${widget.product.avgRating ?? 4.5}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}