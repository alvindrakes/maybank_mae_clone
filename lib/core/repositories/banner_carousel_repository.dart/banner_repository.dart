import 'package:http/http.dart' as http;

abstract class BannerRepository {
  Future<http.Response> getBannerCarousel();
}
