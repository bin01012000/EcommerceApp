import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/rounded_btn_icon.dart';
import '../../../size_config.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;
  const CustomAppBar({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              iconData: Icons.arrow_back_ios_new,
              press: () => Navigator.pop(context),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SvgPicture.asset("assets/icons/Star Icon.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
