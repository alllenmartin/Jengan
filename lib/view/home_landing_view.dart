import 'package:flutter/material.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/utils/submit_button.dart';

class HomeLandingView extends StatefulWidget {
  const HomeLandingView({super.key});

  @override
  State<HomeLandingView> createState() => _HomeLandingViewState();
}

class _HomeLandingViewState extends State<HomeLandingView> {
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
          actions: [
            IconButton(
              onPressed: () {
                bottomSheet(context);
              },
              icon: Icon(Icons.person),
              color: Globalcolors.otherColor,
            ),
          ],
          title: Text('Home', style: TextStyle(color: Globalcolors.otherColor)),
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

bottomSheet(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(0, 167, 94, 94),
      builder: (context) => Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    decoration: BoxDecoration(
                      color: Globalcolors.otherColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border_purple500,
                                color: Globalcolors.mainColor,
                                size: 45,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomCard(
                            title: 'Account Balance',
                            iconData: Icons.account_balance,
                            colorData: Colors.green,
                          ),
                          CustomCard(
                            title: 'Account Statement',
                            iconData: Icons.calendar_month,
                            colorData: Colors.blue,
                          ),
                          CustomCard(
                            title: 'Change PIN',
                            iconData: Icons.key,
                            colorData: Colors.grey,
                          ),
                          SizedBox(height: 20.0),
                          Center(
                            child: Submitbutton(
                              onTap: () => Navigator.pop(context, true),
                              btnColor: Globalcolors.mainColor,
                              text: 'Cancel',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
}
