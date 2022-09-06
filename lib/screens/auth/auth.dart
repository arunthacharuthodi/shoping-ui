import 'package:flutter/material.dart';
import 'package:ekraft/utils/theme.dart';

class AuthenticationScreen extends StatefulWidget {
  final bool showAppBar;
  const AuthenticationScreen({
    Key? key,
    this.showAppBar = false,
  }) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: const Text('Authentication'),
              foregroundColor: StoreTheme.black,
            )
          : null,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email"),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "you@something.com",
                ),
              ),
              const SizedBox(height: 20),
              const Text("Password"),
              const SizedBox(height: 10),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "********",
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Login / Sign Up",
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      StoreTheme.primaryColor,
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
