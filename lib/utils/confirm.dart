import 'package:ekraft/models/shoe.dart';
import 'package:ekraft/provider/cart.dart';
import 'package:ekraft/utils/theme.dart';
import 'package:flutter/material.dart';

void confirmOrder(
  BuildContext context,
  Cart cart, {
  bool shouldPop = false,
  Product? product,
}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Confirm Order'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Shipping Address'),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your address',
              border: OutlineInputBorder(),
            ),
            maxLines: 6,
            minLines: 6,
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.payment),
            subtitle: Text("Cash On Delivery"),
            title: Text("Payment Method"),
          )
        ],
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              Navigator.pop(ctx);
              if (product == null) {
                cart.clear();
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: StoreTheme.primaryColor,
                  content: Center(
                    child: Text(
                      'Order Placed',
                    ),
                  ),
                ),
              );
              if (shouldPop) {
                Future.delayed(const Duration(milliseconds: 1500), () {
                  Navigator.pop(context);
                });
              }
            },
          ),
        ),
      ],
    ),
  );
}
