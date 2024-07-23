import 'package:gymbrow/app/data/datasources/configurations_preferences/get_confguration_preference_datasource.dart';
import 'package:gymbrow/app/data/dtos/configuration_preference_dto.dart';
import 'package:gymbrow/app/data/services/database/sqflite/get_database_sqlite_imp.dart';

class GetConfigurationPreferenceImp
    implements GetConfigurationPreferenceDataSource {
  final GetDatabaseSQLiteImp _databaseSQLiteImp;

  GetConfigurationPreferenceImp(this._databaseSQLiteImp);

  @override
  Future<ConfigurationPreferenceDTO> call() async {
    final databaseResponse = await _databaseSQLiteImp();
    List<Map<String, dynamic>> queryResponse;
    try {
      queryResponse = await databaseResponse.query('configuration_preference');

      return ConfigurationPreferenceDTO.fromMapLocalDataBase(
          queryResponse.firstOrNull!);
    } catch (e) {
      throw Exception(e);
    }
  }
}
