import 'package:flutter/material.dart';
import 'package:fruit_app/models/ProductModel.dart';
import 'package:fruit_app/screens/details/details_screen.dart';
import 'package:fruit_app/screens/home/components/product_card.dart';
import 'package:fruit_app/screens/home/components/section_title.dart';

import '../../../api/api.dart';
import '../../../components/rounded_btn_icon.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  List<ProductModel> data = [];

  callApiProduct() async {
    await API.getProduct().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    callApiProduct();
  }

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
                  data.length,
                  (index) => ProductCard(
                        product: data[index],
                        press: () {
                          Navigator.pushNamed(context, DetailsScreen.routeName,
                              arguments: ProductDetailsArgument(data[index]));
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
