import 'package:flutter/material.dart';
import 'package:fruit_app/screens/profile/components/profile_menu.dart';
import 'package:fruit_app/screens/profile/components/profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            press: () {},
            svg: "assets/icons/User Icon.svg",
            text: "Account",
          ),
          ProfileMenu(
            press: () {},
            svg: "assets/icons/Bell.svg",
            text: "Notifications",
          ),
          ProfileMenu(
            press: () {},
            svg: "assets/icons/Settings.svg",
            text: "Settings",
          ),
          ProfileMenu(
            press: () {},
            svg: "assets/icons/Question mark.svg",
            text: "Help Center",
          ),
          ProfileMenu(
            press: () {},
            svg: "assets/icons/Log out.svg",
            text: "Log Out",
          ),
        ],
      ),
    );
  }
}
