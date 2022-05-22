import 'package:flutter/material.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/screens/otp/components/otp_form.dart';
import 'package:fruit_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * .05,
            ),
            Text(
              "OTP Verification",
              style: headingStyle,
            ),
            const Text(
              "We sent your code +1 898 860 ***",
              textAlign: TextAlign.center,
            ),
            buildTimer(),
            SizedBox(
              height: SizeConfig.screenHeight * .15,
            ),
            const OTPForm(),
            SizedBox(
              height: SizeConfig.screenHeight * .1,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Resend OTP",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("This code will expired in"),
        TweenAnimationBuilder(
          tween: IntTween(begin: 30, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            " 00:${value ?? '00'}",
            style: const TextStyle(
              color: kPrimaryColor,
            ),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
