import 'package:ekraft/utils/confirm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ekraft/provider/cart.dart';
import 'package:ekraft/screens/details/details.dart';
import 'package:ekraft/utils/slide.dart';
import 'package:ekraft/utils/theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Scaffold(
      body: buildBody(cart, context),
    );
  }

  Widget buildBody(Cart cart, BuildContext context) {
    if (cart.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Your cart is empty'),
            SizedBox(height: 10),
            Text('Start shopping now!'),
            SizedBox(height: 20),
            Icon(Icons.shopping_cart_outlined),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: cart.items
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        slidingRoute(ShoeDetails(e)),
                      );
                    },
                    child: GridTile(
                      header: Container(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            cart.removeItem(e);
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.delete,
                            color: StoreTheme.black,
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith(
                              (states) => const CircleBorder(),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => StoreTheme.grey,
                            ),
                          ),
                        ),
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
        ),
        Container(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: \$${total(cart).toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  confirmOrder(context, cart);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: buttonStyle(cart),
              )
            ],
          ),
        )
      ],
    );
  }

  double total(Cart cart) {
    return cart.items.fold(0, (t, e) => t + e.price);
  }

  ButtonStyle buttonStyle(Cart cart) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        cart.isEmpty ? StoreTheme.grey : StoreTheme.primaryColor,
      ),
      foregroundColor: MaterialStateProperty.all(
        StoreTheme.white,
      ),
      overlayColor: MaterialStateProperty.all(
        StoreTheme.white.withOpacity(0.1),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
