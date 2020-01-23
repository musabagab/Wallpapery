import 'package:get_it/get_it.dart';
import 'package:wallpapery/scoped_models/details_model.dart';
import 'package:wallpapery/scoped_models/home_model.dart';
import 'package:wallpapery/scoped_models/trending_model.dart';
import 'package:wallpapery/services/api_service.dart';

import 'database/moor_database.dart';

GetIt locator = GetIt();

void setupLocator() {
  //register services
  locator.registerLazySingleton<AppDatabase>(() => AppDatabase());
  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<HomeModel>(() => HomeModel());
  //register models
  locator.registerFactory<DetailsModel>(() => DetailsModel());
  locator.registerFactory<TrendingModel>(() => TrendingModel());
}
