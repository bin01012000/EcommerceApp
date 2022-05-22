import 'package:flutter/material.dart';
import 'package:fruit_app/screens/otp/components/body.dart';

class OTPScreen extends StatelessWidget {
  static String routeName = '/otp';
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('OTP Verification'),
    );
  }
}
