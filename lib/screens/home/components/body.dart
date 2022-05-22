import 'package:flutter/material.dart';
import 'package:fruit_app/screens/home/components/popular_products.dart';
import 'package:fruit_app/screens/home/components/special_offer.dart';
import 'package:fruit_app/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const HomeHeader(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const DiscountBanner(
              title: "A Summer Suprise",
              name: "Cashback",
              voucher: "20",
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const Categories(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const SpecialOffer(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const PopularProducts()
          ],
        ),
      ),
    );
  }
}
