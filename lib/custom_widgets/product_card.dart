import 'package:flutter/material.dart';
import 'package:grid_example/custom_widgets/discount_text.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.index,
    required this.img,
    required this.isFav,
    required this.discount,
    required this.title,
    required this.price,
  }) : super(key: key);
  final String index;
  final String img;
  final bool isFav;
  final int discount;
  final String title;
  final String price;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite = widget.isFav;
  }

  @override
  Widget build(BuildContext context) {
    //isFavorite = widget.isFav;
    return Card(
      elevation: 0.0,
      shadowColor: Colors.transparent,
      borderOnForeground: true,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 1.0,
          color: Colors.grey,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    'images/${widget.img}',
                    height: 170,
                    width: 170,
                    //fit: BoxFit.fill,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (widget.discount < 70)
                        ? DiscountTextBox(
                            discount_amount: widget.discount,
                          )
                        : Container(),
                    IconButton(
                      alignment: Alignment.topRight,
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        print('icon pressed');
                      },
                      icon: const Icon(
                        Icons.favorite,
                      ),
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'ကျပ် ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                      children: [
                        TextSpan(
                          text: widget.price,
                          style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
