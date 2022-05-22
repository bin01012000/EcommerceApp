import 'package:flutter/material.dart';
import 'package:fruit_app/components/default_button.dart';
import 'package:fruit_app/screens/home/components/body.dart';
import 'package:fruit_app/size_config.dart';

import '../../home/home_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.08,
          ),
          Text(
            "Login Success",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(30),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back to home",
              press: () {
                Navigator.popAndPushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
