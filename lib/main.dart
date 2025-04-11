import 'package:flutter/material.dart';
import 'package:laundry_uas/pages/home_pages.dart';

void main() {
  runApp(const LaundryApp());
}

class LaundryApp extends StatelessWidget {
  const LaundryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laundry Express',
      theme: ThemeData(fontFamily: 'Sans', brightness: Brightness.light),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
