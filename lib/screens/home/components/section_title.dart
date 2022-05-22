import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final GestureTapCallback press;
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          ),
          GestureDetector(
            onTap: press,
            child: const Text("See More"),
          ),
        ],
      ),
    );
  }
}
