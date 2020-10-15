import 'package:flutter/cupertino.dart';

class ActionCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData iconData;

  const ActionCard({
    Key key,
    @required this.onPressed,
    @required this.title,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
