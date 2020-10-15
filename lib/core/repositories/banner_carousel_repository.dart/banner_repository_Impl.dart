import 'dart:io';

import 'package:http/http.dart' as http;

import '../../exceptions/network_exception.dart';
import '../../exceptions/repository_exception.dart';
import 'banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  static const BANNERS_API = 'http://stg.gruube.com/api/banners';
  static const HEADERS = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json'
  };

  @override
  Future<http.Response> getBannerCarousel() async {
    try {
      return http.get('$BANNERS_API?start=0&length=10', headers: HEADERS);
    } on NetworkException catch (e) {
      throw RepositoryException(e.message);
    }
  }
}
