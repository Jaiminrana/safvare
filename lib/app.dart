import 'package:flutter/material.dart';
import 'package:sofvare/modules/home/store/home_store.dart';
import 'package:sofvare/modules/home/view/home_screen.dart';
import 'package:sofvare/utils/extensions.dart';

class SofvareApp extends StatelessWidget {
  const SofvareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen().withProvider(
        HomeStore(),
      ),
    );
  }
}
