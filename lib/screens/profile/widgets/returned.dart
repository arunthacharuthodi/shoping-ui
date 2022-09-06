import 'package:flutter/material.dart';

class ReturnedOrders extends StatefulWidget {
  const ReturnedOrders({Key? key}) : super(key: key);

  @override
  State<ReturnedOrders> createState() => _ReturnedOrdersState();
}

class _ReturnedOrdersState extends State<ReturnedOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Returned Orders"),
      ),
      body: const Center(
        child: Text(
          "No Returned Orders",
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
