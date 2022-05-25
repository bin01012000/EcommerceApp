import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/screens/details/components/body.dart';
import 'package:fruit_app/size_config.dart';

import '../../components/rounded_btn_icon.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArgument;
    return Scaffold(
      backgroundColor: const Color(0xfff5f6f9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          rating: args.product.rating!.toDouble(),
        ),
      ),
      body: Body(product: args.product),
    );
  }
}
