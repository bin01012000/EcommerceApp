import 'package:flutter/material.dart';
import 'package:fruit_app/components/default_button.dart';
import 'package:fruit_app/models/ProductModel.dart';
import 'package:fruit_app/screens/details/components/product_description.dart';
import 'package:fruit_app/screens/details/components/product_images.dart';
import 'package:fruit_app/screens/details/components/top_rounded_container.dart';
import 'package:fruit_app/size_config.dart';
import '../../../models/Product.dart';
import 'color_dots.dart';

class Body extends StatelessWidget {
  final ProductModel product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xfff6f7f9),
                  child: Column(
                    children: [
                      ColorDots(product: product),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * .15,
                            right: SizeConfig.screenWidth * .15,
                            top: getProportionateScreenWidth(15),
                            bottom: getProportionateScreenWidth(40),
                          ),
                          child: DefaultButton(
                            text: "Add to Cart",
                            press: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
