import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoestoreui/models/shoe.dart';
import 'package:shoestoreui/utils/theme.dart';
import 'package:shoestoreui/widgets/fav_button.dart';

class ShoeDetails extends StatefulWidget {
  final Shoe shoe;
  const ShoeDetails(
    this.shoe, {
    Key? key,
  }) : super(key: key);

  @override
  State<ShoeDetails> createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  int _selectedSize = 39;

  void updateSelectedSize(int size) {
    setState(() {
      _selectedSize = size;
    });
  }

  late Color _selectedColor;

  void updateSelectedColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  void initState() {
    _selectedColor =
        widget.shoe.colors[Random().nextInt(widget.shoe.colors.length)];
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
              Container(
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
                  color: _selectedColor,
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
              Row(
                children: [
                  for (int i = 0; i < 5; i++) ...[
                    Icon(
                      widget.shoe.rating.floor() > i
                          ? Icons.star
                          : Icons.star_outline,
                      color: widget.shoe.rating.floor() > i
                          ? Colors.amber
                          : Colors.grey,
                      size: 18,
                    ),
                  ],
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '(${widget.shoe.rating})',
                    style: const TextStyle(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
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
                height: 30,
              ),
              const Text("Sizes"),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: widget.shoe.sizes
                    .map(
                      (e) => TextButton(
                        onPressed: () {
                          updateSelectedSize(e);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$e"),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith(
                            (states) => CircleBorder(
                              side: BorderSide(
                                color: _selectedSize == e
                                    ? StoreTheme.primaryColor
                                    : StoreTheme.grey,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Colors"),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: widget.shoe.colors
                    .map(
                      (e) => TextButton(
                        onPressed: () {
                          updateSelectedColor(e);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: e == _selectedColor
                              ? const Icon(Icons.done)
                              : const Text(""),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => e,
                          ),
                          shape: MaterialStateProperty.resolveWith(
                            (states) => const CircleBorder(),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Add to Cart"),
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                    side: const BorderSide(color: StoreTheme.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.all(12),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 150,
            child: TextButton(
              onPressed: () {},
              child: const Text("Buy Now"),
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                    side: const BorderSide(color: StoreTheme.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.all(16),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => StoreTheme.primaryColor,
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => StoreTheme.white,
                ),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) => StoreTheme.white.withAlpha(40),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
