import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/fade_in_down.dart';
import 'package:jengana/view/home_view.dart';
import 'package:jengana/view/login_view.dart';
import 'package:otp_text_field/otp_field.dart';

class LoginLandingView extends StatefulWidget {
  const LoginLandingView({super.key});

  @override
  State<LoginLandingView> createState() => _LoginLandingViewState();
}

class _LoginLandingViewState extends State<LoginLandingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globalcolors.otherColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/l1.png',
                height: 80,
              ),
              const SizedBox(
                height: 80,
              ),
              const FadeInDown(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DancingScript'),
                ),
              ),
              FadeInDown(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Please enter your App code ',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OTPTextField(
                width: MediaQuery.of(context).size.width,
                length: 4,
                obscureText: true,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                outlineBorderRadius: 10,
              ),
              const SizedBox(height: 40),
              // Divider(
              //   color: Colors.grey.shade400,
              // ),
              FadeInDown(
                  child: Row(
                children: [
                  Text(
                    'Forgot or want to change your app code ?',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            // Login <-> Home
                            MaterialPageRoute(
                                builder: (builder) => const HomeView()));
                      },
                      child: const Text('Change'))
                ],
              )),
              const SizedBox(height: 30),
              FadeInDown(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      // Login <-> Home
                      MaterialPageRoute(
                          builder: (builder) => const HomeView()));
                },
                color: Globalcolors.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                minWidth: double.infinity,
                child: Text(
                  'Sign In',
                  style:
                      TextStyle(color: Globalcolors.otherColor, fontSize: 15),
                ),
              )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      )),
    );
  }
}
