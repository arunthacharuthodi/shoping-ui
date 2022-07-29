import 'package:ekraft/screens/auth.dart';
import 'package:ekraft/utils/confirm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ekraft/config/data.dart';
import 'package:ekraft/models/shoe.dart';
import 'package:ekraft/provider/cart.dart';
import 'package:ekraft/utils/theme.dart';
import 'package:ekraft/widgets/add_to_cart.dart';
import 'package:ekraft/widgets/buy_now.dart';
import 'package:ekraft/widgets/fav_button.dart';
import 'package:ekraft/widgets/rating.dart';

class ShoeDetails extends StatefulWidget {
  final Product shoe;
  const ShoeDetails(
    this.shoe, {
    Key? key,
  }) : super(key: key);

  @override
  State<ShoeDetails> createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: Hero(
                          tag: "shoe-${widget.shoe.name}",
                          child:
                              Image.asset(widget.shoe.path, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: FavButton(
                        widget.shoe,
                        onTap: () {
                          widget.shoe.updateFavourite();
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.shoe.name,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Rating(rating: widget.shoe.rating),
              const SizedBox(
                height: 20,
              ),
              Text(
                "\$${widget.shoe.price}",
                style: const TextStyle(
                  fontSize: 25,
                  color: StoreTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.shoe.description),
              const SizedBox(
                height: 10,
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AddToCart(
                    onPressed: () {
                      if (!isAuthenticated) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 1500),
                            backgroundColor: StoreTheme.primaryColor,
                            content: Center(
                              child: Text("Product added to cart."),
                            ),
                          ),
                        );

                        Cart cart = Provider.of<Cart>(context, listen: false);
                        cart.addItem(widget.shoe);
                        Future.delayed(const Duration(milliseconds: 2500), () {
                          Navigator.pop(context);
                        });
                      }
                    },
                  ),
                  BuyNow(
                    onPressed: () {
                      if (isAuthenticated) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthenticationScreen(
                              showAppBar: true,
                            ),
                          ),
                        );
                      } else {
                        Cart cart = Provider.of<Cart>(context, listen: false);
                        confirmOrder(
                          context,
                          cart,
                          shouldPop: true,
                          product: widget.shoe,
                        );
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
