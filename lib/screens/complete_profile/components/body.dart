import 'package:flutter/material.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/screens/complete_profile/components/complete_profile_form.dart';
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
              'Complete Profile',
              style: headingStyle,
            ),
            const Text(
              "Complete your details or continue \nwith social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
            const CompleteProfileForm(),
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
