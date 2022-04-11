import 'package:flutter/material.dart';
import 'package:shoestoreui/config/data.dart';
import 'package:shoestoreui/models/shoe.dart';
import 'package:shoestoreui/screens/details.dart';
import 'package:shoestoreui/utils/slide.dart';
import 'package:shoestoreui/utils/theme.dart';
import 'package:shoestoreui/widgets/fav_button.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const StoreSearch(),
              TabBar(
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
              const SizedBox(
                height: 10,
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: ShoeStore.shoes
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            slidingRoute(ShoeDetails(e)),
                          );
                        },
                        child: GridTile(
                          header: FavButton(
                            e,
                            onTap: () {
                              e.updateFavourite();
                              setState(() {});
                            },
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: StoreTheme.whitish,
                                  ),
                                  child: Center(
                                    child: Hero(
                                      tag: "shoe-${e.name}",
                                      child: Image(
                                        image: AssetImage(
                                          e.path,
                                        ),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Text(
                                  e.name,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  '\$${e.price}',
                                  style: const TextStyle(
                                    color: StoreTheme.primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: page,
          onTap: updatePage,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/apps_filled.png"),
              ),
              label: "Store",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
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
}

class StoreSearch extends StatelessWidget {
  const StoreSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: StoreTheme.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const SearchField(),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        hintText: "Search...",
        hintStyle: const TextStyle(
          color: StoreTheme.black,
        ),
        suffixIcon: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 20,
                width: 2,
                color: Colors.black26,
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.search,
                color: StoreTheme.black,
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const ImageIcon(
        AssetImage("assets/images/apps_outlined.png"),
        color: Colors.black,
      ),
    );
  }
}
