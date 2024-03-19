
import 'package:flutter/material.dart';
import 'package:sofvare/apibase/repository.dart';
import 'package:sofvare/app.dart';
import 'package:sofvare/utils/helper.dart';

class AppConfig extends StatefulWidget {
  const AppConfig({super.key});

  @override
  State<AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  @override
  void initState() {
    setAppOrientation();
    Repository.instance.initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SofvareApp();
  }
}
