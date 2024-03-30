import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/fade_in_down.dart';
import 'package:jengana/view/login_view.dart';
import 'package:jengana/view/verification_screen.dart';

class RegisterWithPhone extends StatefulWidget {
  const RegisterWithPhone({super.key});

  @override
  State<RegisterWithPhone> createState() => _RegisterWithPhoneState();
}

class _RegisterWithPhoneState extends State<RegisterWithPhone> {
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
                  'REGISTER',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const FadeInDown(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Enter your phone number to continue, we will send you OTP to verify.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeInDown(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Globalcolors.otherColor,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: Stack(
                    children: [
                      InternationalPhoneNumberInput(
                        onInputChanged: (context) {},
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          useBottomSheetSafeArea: true,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        inputDecoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 15, left: 0),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16)),
                        selectorTextStyle: TextStyle(color: Colors.black),
                        formatInput: true,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                      ),
                      Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
              FadeInDown(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      // Login <-> Home
                      MaterialPageRoute(
                          builder: (builder) => const VerificationScreen()));
                },
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                minWidth: double.infinity,
                child: Text(
                  'Request OTP',
                  style: TextStyle(color: Globalcolors.otherColor),
                ),
              )),
              FadeInDown(
                  child: Row(
                children: [
                  Text(
                    'Already have an account?',
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
                      child: const Text('Login'))
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
