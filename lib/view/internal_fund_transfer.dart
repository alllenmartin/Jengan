import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });
  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

Future<void> sendGetBankRequest() async {
  final apiUrl = "https://7ed7-41-90-68-178.ngrok-free.app/api/";

  final response = await http.get(
    Uri.parse(apiUrl + 'accountspecific'),
    headers: {"Content-Type": "application/json"},
  );
  if (response.statusCode == 200) {
    print('object');
  } else {
    print(response.statusCode);
  }
}

class InternalFundTransfer extends StatefulWidget {
  const InternalFundTransfer({super.key});

  @override
  State<InternalFundTransfer> createState() => _InternalFundTransferState();
}

class _InternalFundTransferState extends State<InternalFundTransfer> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Globalcolors.mainColor);
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Globalcolors.mainColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Globalcolors.otherColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title:
              Text('Jengana', style: TextStyle(color: Globalcolors.otherColor)),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController debitController = TextEditingController();
  TextEditingController creditController = TextEditingController();
  String? selectedValueCredit;
  String? selectedValueDebit;
  TextEditingController amount = TextEditingController();

  final List<String> genderItems = [
    '1000',
    '1002',
  ];

  final apiUrl = "https://1122-41-60-238-194.ngrok-free.app/api/";

  Future<void> sendPostRequest() async {
    var response = await http.post(Uri.parse(apiUrl + 'testtransfer'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "debit": debitController.text,
          "credit": creditController.text,
          "amount": amount.text,
        }));

    print(response.body);

    if (response.statusCode == 200) {
      // _dialogBuilder(context);
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

  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextFormField(
            //   controller: debitController,
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter some text';
            //     }
            //     return null;
            //   },
            //   textCapitalization: TextCapitalization.characters,
            //   inputFormatters: [
            //     FilteringTextInputFormatter.deny(
            //         RegExp(r'[!@#-+_$%^&*(),;.?":{}|<>]')),
            //     FilteringTextInputFormatter.deny(RegExp(r'\=s')),
            //   ],
            //   decoration: InputDecoration(
            //       label: Text(
            //         'Bank to Credit',
            //         style: TextStyle(color: Globalcolors.mainColor),
            //       ),
            //       hintText: 'Account to credit',
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Globalcolors.mainColor),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Globalcolors.mainColor,
            //           width: 2,
            //         ),
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       errorBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //           color: Colors.red,
            //           width: 2,
            //         ),
            //         borderRadius: BorderRadius.circular(10),
            //       )),
            // ),

            TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                      RegExp(r'[!@#-+_$%^&*(),;.?":{}|<>]')),
                  FilteringTextInputFormatter.deny(RegExp(r'\=s')),
                ],
                validator: (value) {
                  if (value == null || value == 0) {
                    return 'Please enter account';
                  }
                  return null;
                },
                controller: debitController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintText: 'Account To Debit.',
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
            TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                      RegExp(r'[!@#-+_$%^&*(),;.?":{}|<>]')),
                  FilteringTextInputFormatter.deny(RegExp(r'\=s')),
                ],
                validator: (value1) {
                  if (value1 == null) {
                    return 'Please enter account';
                  }
                  return null;
                },
                controller: creditController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintText: 'Account To Credit.',
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
            TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                validator: (value2) {
                  if (value2 == null) {
                    return 'Please enter amount';
                  }
                  return null;
                },
                controller: amount,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintText: 'Enter Amount.',
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
            Row(
              children: [
                Text(''),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Globalcolors.mainColor)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //sendGetBankRequest();
                        sendPostRequest();
                        //fetchAlbum();
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
