import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/fade_in_down.dart';
import 'package:jengana/view/login_view.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;

class VerificationScreen extends StatefulWidget {
  final String phoneNo;
  const VerificationScreen({required this.phoneNo});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();

  final apiUrl =
      "https://09a8-196-216-84-197.ngrok-free.app/api/MemberApps/verifyotp";
  String PhoneNumber = '0790087600';

  Future<void> sendPostRequest() async {
    var response = await http.post(
        Uri.parse(apiUrl +
            '?phoneNumber=' +
            PhoneNumber +
            '&otp=' +
            pinController.text),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phoneNumber": PhoneNumber,
          "otp": pinController.text,
        }));

    print(
        apiUrl + '?phoneNumber=' + PhoneNumber + '&otp=' + pinController.text);
    print(response.body);

    if (response.statusCode == 200) {
      Navigator.push(
          context,
          // Login <-> Home
          MaterialPageRoute(builder: (builder) => const LoginView()));
    } else if (response.statusCode == 404) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text('Phone number not found!')),
      );
    } else {
      print(response.statusCode);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text('An error has occured')),
      );
    }
  }

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
              Form(
                key: formKey,
                child: Pinput(
                  focusNode: focusNode,
                  controller: pinController,
                  separatorBuilder: (index) => const SizedBox(width: 14),
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  length: 4,
                  obscureText: false,
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: Globalcolors.mainColor,
                      ),
                    ],
                  ),
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                ),
              ),
              const SizedBox(height: 80),
              FadeInDown(
                  child: MaterialButton(
                onPressed: () {
                  focusNode.unfocus();
                  if (formKey.currentState!.validate()) {
                    sendPostRequest();
                  }
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
