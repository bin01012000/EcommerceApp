import 'package:flutter/material.dart';

import '../../components/custom_button_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = '/favorite';
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.favourite,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Favorite"),
      centerTitle: true,
    );
  }
}
