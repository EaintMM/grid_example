import 'package:flutter/material.dart';

class DiscountTextBox extends StatelessWidget {
  const DiscountTextBox({
    Key? key,
    this.discount_amount,
  }) : super(key: key);

  final int? discount_amount;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiscountClipper(),
      child: Container(
        color: Colors.red,
        height: 30,
        width: 70,
        child: Center(
          child: discount_amount! < 70
              ? Text(
                  '$discount_amount% ',
                )
              : const Text(''),
        ),
      ),
    );
  }
}

class DiscountClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width, 0.0);

    path.lineTo(size.width * 0.65, size.height);

    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
