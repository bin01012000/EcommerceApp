import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/enums.dart';
import 'package:fruit_app/screens/home/home_screen.dart';

import '../../components/custom_button_nav_bar.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Profile"),
      centerTitle: true,
    );
  }
}
