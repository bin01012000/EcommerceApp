import 'package:flutter/material.dart';
import 'package:fruit_app/screens/details/details_screen.dart';
import 'package:fruit_app/screens/home/components/product_card.dart';
import 'package:fruit_app/screens/home/components/section_title.dart';

import '../../../components/rounded_btn_icon.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Popular Product", press: () {}),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                  demoProducts.length,
                  (index) => ProductCard(
                        product: demoProducts[index],
                        press: () {
                          Navigator.pushNamed(context, DetailsScreen.routeName,
                              arguments:
                                  ProductDetailsArgument(demoProducts[index]));
                        },
                      )),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
