import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecapan_technical_app/core/constant/theme_colors.dart';

import 'expenses_page.dart';
import 'home_page.dart';
import 'maybank2u_page.dart';
import 'more_page.dart';
import 'qr_pay_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> fifthTabNavKey = GlobalKey<NavigatorState>();

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: ThemeColors.kdarkGrey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Maybank2u',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              navigatorKey: firstTabNavKey,
              builder: (BuildContext context) => HomePage(),
            );
            break;
          case 1:
            return CupertinoTabView(
              navigatorKey: secondTabNavKey,
              builder: (BuildContext context) => Maybank2UPage(),
            );
            break;
          case 2:
            return CupertinoTabView(
              navigatorKey: thirdTabNavKey,
              builder: (BuildContext context) => QRPayPage(),
            );
            break;
          case 3:
            return CupertinoTabView(
              navigatorKey: fourthTabNavKey,
              builder: (BuildContext context) => ExpensesPage(),
            );
            break;

          default:
            return CupertinoTabView(
              navigatorKey: fifthTabNavKey,
              builder: (BuildContext context) => MorePage(),
            );
            break;
        }
      },
    );
  }
}
