import 'package:flutter/material.dart';
import 'package:fruit_app/models/ProductModel.dart';

import '../../../components/rounded_btn_icon.dart';
import '../../../size_config.dart';
import 'color_dot.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selected = 0;
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const ColorDot(
              color: Color(0xffffffff),
              isSelected: true,
            ),
          ),
          const Spacer(),
          RoundedIconBtn(
              iconData: Icons.remove,
              press: () {
                setState(() {
                  if (qty == 0) {
                    return;
                  }
                  qty--;
                });
              }),
          SizedBox(
            width: getProportionateScreenWidth(15),
          ),
          Text(
            qty.toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            width: getProportionateScreenWidth(15),
          ),
          RoundedIconBtn(
              iconData: Icons.add,
              press: () {
                setState(() {
                  qty++;
                });
              }),
        ],
      ),
    );
  }
}
