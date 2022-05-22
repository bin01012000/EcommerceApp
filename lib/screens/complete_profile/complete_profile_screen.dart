import 'package:flutter/material.dart';
import 'package:fruit_app/screens/complete_profile/components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = '/complete_profile';
  const CompleteProfileScreen({Key? key}) : super(key: key);

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
      title: const Text("Sign Up"),
    );
  }
}
