import 'package:flutter/material.dart';

class ShippedOrders extends StatefulWidget {
  const ShippedOrders({Key? key}) : super(key: key);

  @override
  State<ShippedOrders> createState() => _ShippedOrdersState();
}

class _ShippedOrdersState extends State<ShippedOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipped Orders"),
      ),
      body: const Center(
        child: Text(
          "No Shipped Orders",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
