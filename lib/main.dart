import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecapan_technical_app/ui/root_page.dart';
import 'locator.dart';

void main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Maybank Mae clone',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: CupertinoColors.systemGrey5,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: CupertinoColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        scaffoldBackgroundColor: CupertinoColors.systemGrey5,
      ),
      home: RootPage(),
    );
  }
}
