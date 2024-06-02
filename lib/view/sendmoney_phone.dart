import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/sendmoneyamount.dart';

class SendmoneyPhone extends StatelessWidget {
  const SendmoneyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController _phoneNumber = TextEditingController();
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
                    controller: _phoneNumber,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      hintText: 'Enter Phone Number',
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
                          Navigator.push(
                              context,
                              // Login <-> Home
                              MaterialPageRoute(
                                  builder: (builder) => SendMoneyScreen(
                                      phoneNumber: _phoneNumber.text)));
                        },
                        child: Text('Next',
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
