import 'package:flutter/material.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/fade_in_down.dart';
import 'package:jengana/view/login_landing_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globalcolors.mainColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      // Login <-> Home
                      MaterialPageRoute(
                          builder: (builder) => const LoginLandingView()));
                },
                color: Globalcolors.otherColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                minWidth: double.infinity,
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.black),
                ),
              )),
              const SizedBox(height: 10),
              FadeInDown(
                  child: Text(
                'By signing in, I agree to the T&C\u0027s',
                style: TextStyle(color: Globalcolors.otherColor),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
