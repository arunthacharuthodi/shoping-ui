import 'package:flutter/material.dart';
import 'package:ekraft/utils/theme.dart';

class BuyNow extends StatelessWidget {
  final VoidCallback onPressed;
  const BuyNow({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextButton(
        onPressed: onPressed,
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
    );
  }
}
