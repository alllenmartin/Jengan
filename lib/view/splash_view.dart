import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globalcolors.mainColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //Text(
          //   'Jenga Mama',
          //   style: TextStyle(
          //       color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          // ),

          Image.asset('assets/images/Logo1.png'),
        ]),
      ),
    );
  }
}
