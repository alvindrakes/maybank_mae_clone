import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mecapan_technical_app/core/constant/theme_colors.dart';
import 'package:mecapan_technical_app/ui/shared_widgets/action_card.dart';

class PayBillPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 60,
        title: Text('Pay Bills'),
        leading: CupertinoButton(
          child: Icon(
            Icons.arrow_back,
            color: CupertinoColors.black,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          NewPayment(),
          const SizedBox(height: 20),
          FavouritesSection(),
        ],
      ),
    );
  }
}

class NewPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Payment',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ActionCard(
                title: 'Pay bills',
                iconData: CupertinoIcons.money_dollar,
                onPressed: () {},
              ),
              const SizedBox(width: 10.0),
              ActionCard(
                title: 'JomPay',
                iconData: CupertinoIcons.money_dollar,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

class FavouritesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Favourites',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
        ),
        _searchBar(),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      margin: const EdgeInsets.all(22.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: ThemeColors.searchBar,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            children: <InlineSpan>[
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
