import 'package:get/get.dart';
import 'package:gymbrow/app/data/datasources/configurations_preferences/get_confguration_preference_datasource.dart';
import 'package:gymbrow/app/data/datasources/configurations_preferences/get_configuration_preference_imp.dart';
import 'package:gymbrow/app/data/datasources/configurations_preferences/update_confguration_preference_datasource.dart';
import 'package:gymbrow/app/data/datasources/configurations_preferences/update_confguration_preference_imp.dart';
import 'package:gymbrow/app/data/services/database/sqflite/get_database_sqlite_imp.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //views controller
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    //database
    Get.lazyPut<GetDatabaseSQLiteImp>(() => GetDatabaseSQLiteImp());


    // datasources
    Get.lazyPut<GetConfigurationPreferenceDataSource>(
      () => GetConfigurationPreferenceImp(
        Get.find(),
      ),
    );

    Get.lazyPut<UpdateConfigurationPreferenceDataSource>(
      () => UpdateConfigurationPreferenceImp(
        Get.find(),
      ),
    );
  }
}
