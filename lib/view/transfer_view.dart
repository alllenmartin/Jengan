import 'package:flutter/material.dart';
import 'package:jengana/main.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/internal_fund_transfer.dart';
import 'package:jengana/view/login_landing_view.dart';
import 'package:jengana/view/sendmoney_phone.dart';
import 'package:jengana/view/test.dart';
import 'package:select_field/select_field.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class TransferView extends StatefulWidget {
  const TransferView({super.key});

  @override
  State<TransferView> createState() => _TransferViewState();
}

class _TransferViewState extends State<TransferView> {
  @override
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: Column(
            children: [
              //Withdraw Money
              CustomCard(
                title: 'Withdraw Money',
                iconData: Icons.upload_rounded,
                colorData: Colors.red,
                funcData: () => Allen(),
              ),
              SizedBox(
                height: 10,
              ),
              //Deposit Money
              CustomCard(
                title: 'Deposit Money',
                iconData: Icons.download_rounded,
                colorData: Colors.green,
                funcData: () => Allen(),
              ),
              SizedBox(
                height: 10,
              ),

              //Buy Airtime
              USSDCard(
                title: 'Buy Airtime',
                iconData: Icons.phone,
                colorData: Colors.green,
                funcData: () =>
                    UssdAdvanced.sendUssd(code: '*334#', subscriptionId: 1),
              ),
              SizedBox(
                height: 10,
              ),

              //Account Balance
              CustomCard(
                title: 'Account Balance',
                iconData: Icons.account_balance,
                colorData: Colors.blue,
                funcData: () => Allen(),
              ),
              SizedBox(
                height: 10,
              ),

              //Send Money
              CustomCard(
                title: 'Send Money',
                iconData: Icons.send_outlined,
                colorData: Colors.grey,
                funcData: () => SendmoneyPhone(),
              ),
              SizedBox(
                height: 10,
              ),

              //Pay Bills
              CustomCard(
                title: 'Pay Bills',
                iconData: Icons.payment,
                colorData: Colors.black,
                funcData: () => InternalFundTransfer(),
              ),
              SizedBox(
                height: 10,
              ),

              //Inter Transfer
              CustomCard(
                title: 'Internal Fund Transfer',
                iconData: Icons.interests,
                colorData: Colors.green,
                funcData: () => InternalFundTransfer(),
              ),
            ],
          ),
        ));
  }
}

class Allen extends StatelessWidget {
  const Allen({super.key});

  @override
  Widget build(BuildContext context) {
    const fruitOptions = <String>[
      'Apple',
      'Banana',
      'Strawberry',
      'Cherry',
      'Orange',
      'Raspberry',
    ];
    final options = fruitOptions
        .map((fruit) => Option(label: fruit, value: fruit))
        .toList();
    return Material(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 320, horizontal: 30),
          child: SelectField(
            options: options,
            initialOption: Option<String>(
              label: fruitOptions[0],
              value: fruitOptions[0],
            ),
            menuPosition: MenuPosition.below,
            onTextChanged: (value) => debugPrint(value),
            onOptionSelected: (option) => debugPrint(option.toString()),
            inputStyle: const TextStyle(),
            menuDecoration: MenuDecoration(
              margin: const EdgeInsets.only(top: 8),
              height: 365,
              alignment: MenuAlignment.center,
              backgroundDecoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 1),
                    color: Colors.brown[300]!,
                    blurRadius: 3,
                  ),
                ],
              ),
              animationDuration: const Duration(milliseconds: 400),
              buttonStyle: TextButton.styleFrom(
                fixedSize: const Size(double.infinity, 60),
                backgroundColor: Colors.green[100],
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(16),
                shape: const RoundedRectangleBorder(),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              separatorBuilder: (context, index) => Container(
                height: 1,
                width: double.infinity,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color colorData;
  final Function() funcData;

  CustomCard(
      {required this.title,
      required this.iconData,
      required this.colorData,
      required this.funcData});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => funcData()));
        },
        child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    iconData,
                    size: 24,
                    color: colorData,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(title),
                ],
              ),
            )),
      ),
    );
  }
}

class USSDCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color colorData;
  final Function() funcData;

  USSDCard(
      {required this.title,
      required this.iconData,
      required this.colorData,
      required this.funcData});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          UssdAdvanced.sendUssd(code: '*334#', subscriptionId: 1);
        },
        child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    iconData,
                    size: 24,
                    color: colorData,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(title),
                ],
              ),
            )),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Fund Transfer'),
        content: const Text(
          'A bank fund transfer process has been\n'
          'initiated\n'
          'between the two specified accounts.\n'
          'We will notify you of the status shortly.',
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
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
