import 'package:flutter/material.dart';
import 'package:zybo/presentation/widget/commonwidget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                 search(),
                 SizedBox(height: 20),
                 BannerAd(),
                const SizedBox(height: 20),
                 SectionTitle(title: 'Popular Products'),
                 ProductGrid(),
                const SizedBox(height: 20),
                 SectionTitle(title: 'Latest Products'),
                 ProductGrid(),
              ],
            ),
          ),
        );
      },
    );
  }
}
