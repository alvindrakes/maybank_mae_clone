import 'package:flutter/foundation.dart';

class BannerCarousel {
  final String title;
  final String imageUrl;

  BannerCarousel({
    @required this.title,
    @required this.imageUrl,
  });

  factory BannerCarousel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BannerCarousel(
      title: map['title'],
      imageUrl: map['imageLink'],
    );
  }
}
