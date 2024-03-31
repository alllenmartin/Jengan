import 'package:flutter/material.dart';
import 'package:jengana/utils/globalColors.dart';

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
          title: Text('Fund Transfer',
              style: TextStyle(color: Globalcolors.otherColor)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            children: [
              //Withdraw Money
              CustomCard(
                title: 'Withdraw Money',
                iconData: Icons.upload_rounded,
                colorData: Colors.red,
              ),
              SizedBox(
                height: 10,
              ),
              //Deposit Money
              CustomCard(
                title: 'Deposit Money',
                iconData: Icons.download_rounded,
                colorData: Colors.green,
              ),
              SizedBox(
                height: 10,
              ),

              //Buy Airtime
              CustomCard(
                title: 'Buy Airtime',
                iconData: Icons.phone,
                colorData: Colors.green,
              ),
              SizedBox(
                height: 10,
              ),

              //Account Balance
              CustomCard(
                title: 'Account Balance',
                iconData: Icons.account_balance,
                colorData: Colors.blue,
              ),
              SizedBox(
                height: 10,
              ),

              //Send Money
              CustomCard(
                title: 'Send Money',
                iconData: Icons.send_outlined,
                colorData: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),

              //Pay Bills
              CustomCard(
                title: 'Pay Bills',
                iconData: Icons.payment,
                colorData: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),

              //Inter Transfer
              CustomCard(
                title: 'Internal Fund Transfer',
                iconData: Icons.interests,
                colorData: Colors.green,
              )
            ],
          ),
        ));
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color colorData;

  CustomCard(
      {required this.title, required this.iconData, required this.colorData});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
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
