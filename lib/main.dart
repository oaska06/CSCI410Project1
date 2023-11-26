import 'package:flutter/material.dart';
import 'home.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lebanon Bus (From Beirut)',
      home: Welcome(),
    );
  }
}


