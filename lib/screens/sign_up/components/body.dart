import 'package:flutter/material.dart';
import 'package:fruit_app/components/custom_suffix_icon.dart';
import 'package:fruit_app/components/default_button.dart';
import 'package:fruit_app/components/form_error.dart';
import 'package:fruit_app/components/social_card.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/screens/sign_up/components/sign_up_form.dart';
import 'package:fruit_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            Text(
              'Register Account',
              style: headingStyle,
            ),
            const Text(
              "Complete your details or continue \nwith social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
            const SignUpForm(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: "assets/icons/google-icon.svg",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/facebook-2.svg",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/twitter.svg",
                  press: () {},
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text(
              "By continuing your confirm that you agree \nwith our Term and Condition",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
