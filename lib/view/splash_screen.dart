import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/login_view.dart';
import 'package:jengana/view/register_with_phone.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const RegisterWithPhone())));
    return Scaffold(
      backgroundColor: Globalcolors.otherColor,
      body: Center(
        child: Image.asset('assets/images/l1.png'),
      ),
    );
  }
}
