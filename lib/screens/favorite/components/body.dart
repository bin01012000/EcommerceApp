import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fruit_app/models/Fav.dart';
import 'package:fruit_app/models/ProductModel.dart';
import 'package:fruit_app/models/User.dart';
import 'package:fruit_app/screens/home/components/product_card.dart';

import '../../../api/api.dart';
import '../../../components/rounded_btn_icon.dart';
import '../../details/details_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  dynamic user = FlutterSession().get("login");
  List<ProductModel> fav = [];
  callApi() async {
    await API.getFav('bin01012000@gmail.com').then((value) {
      setState(() {
        fav = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // print('a');
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 200,
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        itemCount: fav.length,
        itemBuilder: (BuildContext ctx, index) {
          return Wrap(
            children: [
              ProductCard(
                product: fav[index],
                press: () {
                  Navigator.pushNamed(context, DetailsScreen.routeName,
                      arguments: ProductDetailsArgument(fav[index]));
                },
              )
            ],
          );
        });
  }
}
