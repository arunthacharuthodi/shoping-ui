import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ekraft/provider/cart.dart';
import 'package:ekraft/screens/home.dart';
import 'package:ekraft/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        home: const Home(),
      ),
    );
  }
}
