import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:jengana/utils/globalColors.dart';
import 'package:jengana/view/home_landing_view.dart';
import 'package:jengana/view/loans_view.dart';
import 'package:jengana/view/transfer_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final items = [
      CurvedNavigationBarItem(
        child: Icon(
          Icons.home_outlined,
          size: 24,
        ),
        label: 'Home',
      ),
      CurvedNavigationBarItem(
        child: Icon(
          Icons.money,
          size: 24,
        ),
        label: 'Loans',
      ),
      CurvedNavigationBarItem(
        child: Icon(
          Icons.monetization_on_outlined,
          size: 24,
        ),
        label: 'Transfers',
      ),
    ];
    final screens = [HomeLandingView(), LoansView(), TransferView()];
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(
      //   backgroundColor: Globalcolors.mainColor,
      // ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Globalcolors.otherColor)),
        child: CurvedNavigationBar(
          items: items,
          index: index,
          color: Globalcolors.mainColor,
          buttonBackgroundColor: Globalcolors.textColor,
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              this.index = index;
              print(index);
            });
          },
        ),
      ),
    );
  }
}
