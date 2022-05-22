import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDot extends StatefulWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  State<ColorDot> createState() => _ColorDotState();
}

class _ColorDotState extends State<ColorDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(8),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        // color: product.colors[0],
        shape: BoxShape.circle,
        border: Border.all(
            color: widget.isSelected ? kPrimaryColor : Colors.transparent),
      ),
      child: DecoratedBox(
          decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
      )),
    );
  }
}
