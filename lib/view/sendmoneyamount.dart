import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:http/http.dart' as http;

class SendMoneyScreen extends StatelessWidget {
  final String phoneNumber;

  SendMoneyScreen({required this.phoneNumber});

  final _formKey = GlobalKey<FormState>();
  TextEditingController debitController = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final apiUrl = "https://06d2-41-90-69-222.ngrok-free.app/api/";

    //Send Money
    Future<void> sendMoney() async {
      var response = await http.post(Uri.parse(apiUrl + 'sendmoney'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "phone": phoneNumber,
            "amount": amount.text,
          }));

      print(response.body);

      if (response.statusCode == 200) {
        _dialogBuilder(context);
      } else {
        print(response.statusCode);
      }
    }

    //End
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Globalcolors.mainColor,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Globalcolors.otherColor,
            ),
            onPressed: () {
              print('Drawer');
            },
          ),
          title:
              Text('Jengana', style: TextStyle(color: Globalcolors.otherColor)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'[!@#-+_$%^&*(),;.?":{}|<>]')),
                      FilteringTextInputFormatter.deny(RegExp(r'\=s')),
                    ],
                    validator: (value) {
                      if (value == null || value == 0) {
                        return 'Enter Phone Number';
                      }
                      return null;
                    },
                    controller: amount,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Amount',
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Globalcolors.mainColor)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            sendMoney();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.black,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('Processing Data ...')),
                            );
                          }
                        },
                        child: Text('Submit',
                            style: TextStyle(color: Globalcolors.otherColor)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Jengana Messages'),
        content: const Text(
          'Send money process has been\n'
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
