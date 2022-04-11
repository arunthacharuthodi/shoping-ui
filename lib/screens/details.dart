import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoestoreui/models/shoe.dart';
import 'package:shoestoreui/utils/theme.dart';
import 'package:shoestoreui/widgets/add_to_cart.dart';
import 'package:shoestoreui/widgets/buy_now.dart';
import 'package:shoestoreui/widgets/fav_button.dart';
import 'package:shoestoreui/widgets/rating.dart';
import 'package:shoestoreui/widgets/selection_button.dart';

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
              const Text("Sizes"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: widget.shoe.sizes
                    .map(
                      (e) => SelectionButton<int>(
                        value: e,
                        selectedValue: _selectedSize,
                        updateValue: updateSelectedSize,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Colors"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: widget.shoe.colors
                    .map(
                      (e) => SelectionButton<Color>(
                        value: e,
                        selectedValue: _selectedColor,
                        updateValue: updateSelectedColor,
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  AddToCart(),
                  BuyNow(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
