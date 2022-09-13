import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekraft/screens/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ekraft/provider/cart.dart';
import 'package:ekraft/screens/home.dart';
import 'package:ekraft/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;

  updateUserState(event) {
    setState(() {
      user = event;
    });
  }

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((event) => updateUserState(event));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldMessengerState> scaffoldKey =
        GlobalKey<ScaffoldMessengerState>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldKey,
        debugShowCheckedModeBanner: false,
        title: 'Shoe Store UI',
        theme: StoreTheme.theme,
        home: user == null ? AuthenticationScreen() : Home(),
      ),
    );
  }
}
