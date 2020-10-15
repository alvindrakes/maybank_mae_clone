import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 160,
            color: CupertinoColors.systemYellow,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hello'),
                    const SizedBox(height: 5),
                    Text('Alvin'),
                    const SizedBox(height: 5),
                    Container(
                      child: Text('Settings'),
                    )
                  ],
                ),
                Spacer(),
                CupertinoButton(
                  child: Icon(
                    Icons.logout,
                    color: CupertinoColors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
