import 'package:flutter/material.dart';
import 'package:jengana/utils/globalColors.dart';

class LoansView extends StatefulWidget {
  const LoansView({super.key});

  @override
  State<LoansView> createState() => _LoansViewState();
}

class _LoansViewState extends State<LoansView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: ClipRect(
            child: Scaffold(
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
                  title: Text('Loans',
                      style: TextStyle(color: Globalcolors.otherColor)),
                ),
                body: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Column(
                    children: [
                      //Withdraw Money
                      CustomCard(
                        title: 'Apply Loan',
                        iconData: Icons.edit_document,
                        colorData: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Deposit Money
                      CustomCard(
                        title: 'Pay Loan',
                        iconData: Icons.account_box_outlined,
                        colorData: Colors.green,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Buy Airtime
                      CustomCard(
                        title: 'Loan Balance',
                        iconData: Icons.account_balance,
                        colorData: Colors.green,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Account Balance
                      CustomCard(
                        title: 'Check Loan Limit',
                        iconData: Icons.calculate_outlined,
                        colorData: Colors.blue,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Send Money
                      CustomCard(
                        title: 'Loan Statement',
                        iconData: Icons.calendar_month,
                        colorData: Colors.grey,
                      )
                    ],
                  ),
                ))));
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
