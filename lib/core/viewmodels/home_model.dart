import 'dart:convert';
import 'dart:io';

import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../logger.dart';
import '../exceptions/repository_exception.dart';
import '../models/banner_carousel.dart';
import '../repositories/banner_carousel_repository.dart/banner_repository.dart';

class HomeModel extends BaseViewModel {
  final log = getLogger('HomeModel');

  final _bannerRepo = locator<BannerRepository>();

  List<BannerCarousel> bannercarouselsList = [];

  Future<void> getBannerCarousel() async {
    setBusy(true);
    try {
      final response = await _bannerRepo.getBannerCarousel();

      if (response.statusCode == HttpStatus.ok) {
        final List bannerData =
            json.decode(response.body)['response']['banners'];

        for (var i = 0; i < bannerData.length; i++) {
          bannercarouselsList.add(
            BannerCarousel.fromMap(bannerData[i]),
          );
        }

        log.i(bannercarouselsList[0]);
        setBusy(false);
      }
    } on RepositoryException catch (e) {
      log.w(e.toString());
      setBusy(false);
    }
  }
}
