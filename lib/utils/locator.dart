import 'package:get_it/get_it.dart';
import 'package:newsapp/scoped_model/home_scoped_model.dart';
import 'package:newsapp/services/home_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  //Services
  locator.registerLazySingleton<HomeService>(() => HomeService());
  //Models
  locator.registerFactory<HomeScopedModel>(() => HomeScopedModel());
}
