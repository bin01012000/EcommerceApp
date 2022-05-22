import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  final String title, name, voucher;
  const DiscountBanner({
    Key? key,
    required this.title,
    required this.name,
    required this.voucher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        color: const Color(0xff4a3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: "$title\n",
          style: const TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "$name $voucher%",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
