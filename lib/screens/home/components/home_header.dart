import 'package:flutter/material.dart';
import 'package:fruit_app/screens/cart/cart_screen.dart';
import 'package:fruit_app/screens/home/components/search_field.dart';
import 'package:fruit_app/screens/profile/profile_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SearchField(),
          IconBtnWithCounter(
            svg: "assets/icons/Cart Icon.svg",
            counter: 1,
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          IconBtnWithCounter(
            svg: "assets/icons/Bell.svg",
            counter: 0,
            press: () {},
          ),
        ],
      ),
    );
  }
}
