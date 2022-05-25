import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/screens/otp/components/otp_form.dart';
import 'package:fruit_app/size_config.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  void handleResend({required String u, required int oldCode}) async {
    int randomF(min, max) {
      return min + Random().nextInt(max - min);
    }

    int code = randomF(1000, 9999);
    oldCode = code;
    final smtpServer = gmail('ngduonganhhuy@gmail.com', 'wtldhdnecjayispa');
    final message = Message()
      ..from = const Address('ngduonganhhuy@gmail.com', 'Dier Store')
      ..recipients.add(u)
      ..subject = 'Verify Your Email'
      ..text = 'This is your code: $code';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as OTPArguments;
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
            Text(
              "We sent your code ${args.gmail}",
              textAlign: TextAlign.center,
            ),
            buildTimer(),
            SizedBox(
              height: SizeConfig.screenHeight * .15,
            ),
            OTPForm(
              code: args.code,
              user: args.gmail,
              pass: args.password,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .1,
            ),
            GestureDetector(
              onTap: () {
                handleResend(u: args.gmail, oldCode: args.code);
              },
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

class OTPArguments {
  late final int code;
  late final String gmail;
  late final String password;
  OTPArguments(this.code, this.gmail, this.password);
}
