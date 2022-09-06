import 'package:flutter/material.dart';
import 'package:ekraft/config/data.dart';
import 'package:ekraft/screens/details/details.dart';
import 'package:ekraft/utils/slide.dart';
import 'package:ekraft/utils/theme.dart';
import 'package:ekraft/widgets/fav_button.dart';

class ItemsGridView extends StatefulWidget {
  const ItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemsGridView> createState() => _ItemsGridViewState();
}

class _ItemsGridViewState extends State<ItemsGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        childAspectRatio: 1.5,
        shrinkWrap: true,
        crossAxisCount: 1,
        children: Store.shoes
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
      ),
    );
  }
}
