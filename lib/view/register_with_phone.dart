import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/fade_in_down.dart';
import 'package:jengana/view/login_view.dart';
import 'package:jengana/view/verification_screen.dart';
import 'package:http/http.dart' as http;

class RegisterWithPhone extends StatefulWidget {
  const RegisterWithPhone({super.key});

  @override
  State<RegisterWithPhone> createState() => _RegisterWithPhoneState();
}

class _RegisterWithPhoneState extends State<RegisterWithPhone> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'KE';
  PhoneNumber number = PhoneNumber(isoCode: 'KE');
  final apiUrl =
      "https://4f91-2c0f-fe38-2401-cdca-f5db-4e46-4661-f07f.ngrok-free.app/api/MemberApps";

  Future<void> sendPostRequest() async {
    var response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phoneNumber": '+254' + controller.text,
        }));

    print(response.body);

    if (response.statusCode == 201) {
      Navigator.push(
          context,
          // Login <-> Home
          MaterialPageRoute(
              builder: (builder) => VerificationScreen(
                    phoneNo: controller.text,
                  )));
    } else {
      print(response.statusCode);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text('An error occured ...')),
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
                  child: Form(
                    key: formKey,
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          maxLength: 10,
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          initialValue: number,
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            useBottomSheetSafeArea: true,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          textFieldController: controller,
                          validator: (userInput) {
                            if (userInput!.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
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
              ),
              const SizedBox(height: 100),
              FadeInDown(
                  child: MaterialButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    sendPostRequest();
                  }
                  ;
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

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Jengana Messages'),
        content: const Text(
          'A bank fund transfer process has been\n'
          'initiated.\n'
          'You will receive sms status shortly.',
        ),
        actions: <Widget>[
          // TextButton(
          //   style: TextButton.styleFrom(
          //     textStyle: Theme.of(context).textTheme.labelLarge,
          //   ),
          //   child: const Text('Disable'),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
