import 'package:get_it/get_it.dart';
import 'package:mecapan_technical_app/core/repositories/banner_carousel_repository.dart/banner_repository.dart';
import 'package:mecapan_technical_app/core/repositories/banner_carousel_repository.dart/banner_repository_Impl.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // for services or viewmodels that needs to be kept alive throughout the app
  locator.registerLazySingleton<BannerRepository>(() => BannerRepositoryImpl());
}
