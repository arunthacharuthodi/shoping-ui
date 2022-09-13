import 'package:ekraft/screens/auth/signup.dart';
import 'package:ekraft/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
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
                decoration: const InputDecoration(
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
                decoration: const InputDecoration(
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignUpPage()));
                        },
                        child: Text("dont have a acound ? signup"),
                      ),
                      TextButton(
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Home()));
                            } on FirebaseAuthException catch (err) {
                              print(err);
                            }
                          },
                          child: Text("signIn"))
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
