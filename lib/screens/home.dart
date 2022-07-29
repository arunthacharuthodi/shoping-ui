import 'package:flutter/material.dart';
import 'package:ekraft/screens/cart.dart';
import 'package:ekraft/utils/theme.dart';
import 'package:ekraft/widgets/bottom_nav.dart';
import 'package:ekraft/widgets/items_grid.dart';
import 'package:ekraft/widgets/menu_button.dart';
import 'package:ekraft/widgets/search.dart';

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
        onPressed: () {},
        icon: const Icon(Icons.notifications_outlined),
      ),
      IconButton(
        onPressed: () {},
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
    return const ActualHome();
  }
}

class ActualHome extends StatelessWidget {
  const ActualHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StoreSearch(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBar(
            isScrollable: true,
            tabs: const [
              Tab(text: 'All Shoes'),
              Tab(text: 'New Arrivals'),
              Tab(text: 'Best Sellers'),
              Tab(text: 'Running'),
              Tab(text: 'Jordan'),
              Tab(text: 'Casual'),
            ],
            indicator: BoxDecoration(
              color: StoreTheme.primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            labelColor: StoreTheme.white,
            unselectedLabelColor: StoreTheme.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const ItemsGridView(),
      ],
    );
  }
}
