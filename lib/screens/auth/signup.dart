import 'package:ekraft/screens/auth/auth.dart';
import 'package:ekraft/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ekraft/utils/theme.dart';

class SignUpPage extends StatefulWidget {
  final bool showAppBar;
  const SignUpPage({
    Key? key,
    this.showAppBar = false,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
        foregroundColor: StoreTheme.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email"),
              const SizedBox(height: 10),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "you@something.com",
                ),
              ),
              const SizedBox(height: 20),
              const Text("Password"),
              const SizedBox(height: 10),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "********",
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AuthenticationScreen()));
                          },
                          child: Text("already have a acound ? sign in")),
                      TextButton(
                        onPressed: () {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          Future<UserCredential> user =
                              auth.createUserWithEmailAndPassword(
                                  email: email.text, password: password.text);
                          user.whenComplete(() => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Home())));
                        },
                        child: Text("signup"),
                      ),
                    ],
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
