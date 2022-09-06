import 'package:ekraft/screens/profile/profile.dart';
import 'package:ekraft/screens/settings/settings.dart';
import 'package:ekraft/screens/widgets/main_home.dart';
import 'package:flutter/material.dart';
import 'package:ekraft/screens/auth/cart.dart';
import 'package:ekraft/widgets/bottom_nav.dart';
import 'package:ekraft/widgets/menu_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int page = 0;

  void updatePage(int x) {
    setState(() {
      page = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: const MenuButton(),
          actions: actionButtons,
        ),
        body: body(),
        bottomNavigationBar: StoreBottomNavigation(
          page: page,
          updatePage: updatePage,
        ),
      ),
    );
  }

  List<Widget> get actionButtons {
    return [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
        },
        icon: const Icon(Icons.settings_outlined),
      ),
    ];
  }

  Widget body() {
    if (page == 0) {
      return const ActualHome();
    }
    if (page == 1) {
      return const CartScreen();
    }

    if (page == 2) {
      return const ProfilePage();
    }
    return const ActualHome();
  }
}
