import 'package:flutter/material.dart';

class RegisterSeller extends StatefulWidget {
  const RegisterSeller({Key? key}) : super(key: key);

  @override
  State<RegisterSeller> createState() => _RegisterSellerState();
}

class _RegisterSellerState extends State<RegisterSeller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Become A Seller"),
      ),
      body: ListView(
        // form
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Please fill in the form below to register as a seller",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Name",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Email",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your phone number',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Address",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your address',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Product",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter product details',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
