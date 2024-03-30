import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/fade_in_down.dart';
import 'package:jengana/view/login_view.dart';
import 'package:otp_text_field/otp_field.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
                height: 50,
              ),
              const FadeInDown(
                child: Text(
                  'VERIFICATION',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DancingScript'),
                ),
              ),
              const FadeInDown(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'We have sent the otp to your number.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              OTPTextField(
                width: MediaQuery.of(context).size.width,
                length: 4,
                obscureText: false,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                outlineBorderRadius: 10,
              ),
              const SizedBox(height: 100),
              FadeInDown(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                minWidth: double.infinity,
                child: Text(
                  'Verify OTP',
                  style: TextStyle(color: Globalcolors.otherColor),
                ),
              )),
              const SizedBox(height: 20),
              FadeInDown(
                  child: Row(
                children: [
                  Text(
                    'Did not receive the otp?',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            // Login <-> Home
                            MaterialPageRoute(
                                builder: (builder) => const LoginView()));
                      },
                      child: const Text('Resend'))
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
