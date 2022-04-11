import 'package:flutter/material.dart';
import 'package:shoestoreui/screens/home.dart';
import 'package:shoestoreui/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoe Store UI',
      theme: StoreTheme.theme,
      home: const Home(),
    );
  }
}
