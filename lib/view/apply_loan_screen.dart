import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jengana/utils/globalColors.dart';

class ApplyLoanScreen extends StatelessWidget {
  const ApplyLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController _amount = TextEditingController();
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
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    validator: (value) {
                      if (value == null || value == 0) {
                        return 'Enter Phone Number';
                      }
                      return null;
                    },
                    controller: _amount,
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
