import 'package:flutter/material.dart';

import 'widgets/register.dart';
import 'widgets/returned.dart';
import 'widgets/shipped.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String pic = "assets/images/abel.jpeg";

  final List<String> _options = [
    "Shipped Orders",
    "Register To Become A Seller",
    "Returned Orders",
  ];

  void actions(BuildContext context, int ix) {
    switch (ix) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ShippedOrders(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterSeller(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReturnedOrders(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.asset(
              pic,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: Center(
              child: Text(
                "Hello, Abel!",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _options[index],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => actions(context, index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
