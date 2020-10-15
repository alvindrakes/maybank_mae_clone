import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:mecapan_technical_app/core/viewmodels/home_model.dart';
import 'package:mecapan_technical_app/ui/pay_bill_page.dart';
import 'package:stacked/stacked.dart';

import 'shared_widgets/action_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<HomeModel>.nonReactive(
        onModelReady: (model) => model.getBannerCarousel(),
        viewModelBuilder: () => HomeModel(),
        builder: (context, model, _) => ListView(
          children: [
            _BannerCarousel(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  _QuickActions(),
                  Divider(
                    color: CupertinoColors.systemGrey4,
                    height: 50,
                  ),
                  _SpendingSummary(),
                  const SizedBox(height: 40.0),
                  _PromotionBanner(),
                  _DealsForYou(),
                  _TopReads(),
                  const SizedBox(height: 100.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _customTextRow({@required String title, String buttontext}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        Spacer(),
        buttontext != null
            ? Text(
                buttontext,
                style: TextStyle(
                  color: CupertinoColors.systemBlue,
                  fontSize: 16.0,
                ),
              )
            : const SizedBox(),
      ],
    ),
  );
}

Widget topReadsCard({@required String title}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Row(
      children: [
        // Image(
        //   image: null,
        //   height: 50,
        //   width: 50,
        //   color: Colors.yellow,
        // ),
        Container(
          height: 80,
          width: 80,
          color: Colors.yellow,
        ),
        const SizedBox(width: 15),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  const SizedBox(width: 5),
                  Spacer(),
                  Icon(Icons.remove_red_eye_outlined),
                  const SizedBox(width: 5),
                  Text('5541'),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class _BannerCarousel extends ViewModelWidget<HomeModel> {
  @override
  Widget build(BuildContext context, HomeModel model) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: model.isBusy
          ? Center(child: PlatformCircularProgressIndicator())
          : CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 0.99,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 6),
                  height: 220.0,
                  autoPlayCurve: Curves.easeInOut),
              items: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: CupertinoColors.systemYellow,
                  child:
                      Center(child: Text(model.bannercarouselsList[0].title)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: CupertinoColors.destructiveRed,
                  child:
                      Center(child: Text(model.bannercarouselsList[1].title)),
                ),
              ],
            ),
    );
  }
}

class _QuickActions extends ViewModelWidget<HomeModel> {
  @override
  Widget build(BuildContext context, HomeModel model) {
    return Column(
      children: [
        _customTextRow(title: 'Quick Actions', buttontext: 'Manage'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionCard(
              title: 'Pay Bill',
              iconData: Icons.money_rounded,
              onPressed: () => Get.to(PayBillPage()),
            ),
            ActionCard(
              title: 'Transfer',
              iconData: Icons.money_rounded,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Split Bill',
              iconData: Icons.money_rounded,
              onPressed: () {},
            ),
            ActionCard(
              title: 'Reload',
              iconData: Icons.money_rounded,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _SpendingSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _customTextRow(title: 'Spending Summary', buttontext: 'View All'),
        Container(
          height: 200,
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Total monthly spending RM ***'),
              ),
              Divider(
                color: CupertinoColors.systemGrey4,
              ),
              Text(
                'Top Expenses',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              Center(
                child: CupertinoButton(
                  child: Text(
                    'Tap to view',
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 12.0,
                    ),
                  ),
                  onPressed: () {},
                  color: CupertinoColors.systemYellow,
                  borderRadius: BorderRadius.circular(30),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DealsForYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _customTextRow(title: 'Deals For you', buttontext: 'View All'),
        SizedBox(
          height: 170,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _dealsCard(),
              _dealsCard(),
              _dealsCard(),
              _dealsCard(),
              _dealsCard(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _dealsCard() {
  return Container(
    width: 140,
    margin: const EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.0),
      color: CupertinoColors.white,
    ),
  );
}

class _PromotionBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            'https://bq.sg/wp-content/uploads/2018/06/unnamed-9.jpg',
          ),
        ),
      ),
    );
  }
}

class _TopReads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _customTextRow(title: 'Top reads'),
        Container(
          height: 240,
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        const SizedBox(height: 20),
        topReadsCard(
            title: 'Mae Starter Kit: Make the Most of Your App Today!'),
        topReadsCard(
            title: 'What percentage of your salary should you invest?'),
        topReadsCard(title: 'Sikit-sikit can go a long way with tabung'),
      ],
    );
  }
}
