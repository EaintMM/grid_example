import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grid_example/custom_widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  ProductGrid({
    Key? key,
  }) : super(key: key);

  List titles = [
    'Busing 101',
    'Oil filter',
    'Air filter',
    '၃x ယခုဝယ်ပါက ၅၀% ',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 5,
      ),
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        final random_img = 1 + Random().nextInt(4);
        final random_fav = Random().nextInt(2);
        final random_discount = 40 + Random().nextInt(5) * 10;
        final random_price = 20000 + Random().nextInt(10) * 1000;
        return ProductCard(
          index: '$index',
          img: 'tool$random_img.png',
          isFav: random_fav == 0 ? false : true,
          discount: random_discount,
          title: titles[random_img - 1],
          price: '$random_price',
        );
      },
    );
  }
}
