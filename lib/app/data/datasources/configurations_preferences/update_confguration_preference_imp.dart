import 'package:gymbrow/app/data/datasources/configurations_preferences/update_confguration_preference_datasource.dart';
import 'package:gymbrow/app/data/dtos/configuration_preference_dto.dart';
import 'package:gymbrow/app/data/services/database/sqflite/get_database_sqlite_imp.dart';

class UpdateConfigurationPreferenceImp
    implements UpdateConfigurationPreferenceDataSource {
  final GetDatabaseSQLiteImp _getDatabaseSQLiteImp;

  UpdateConfigurationPreferenceImp(this._getDatabaseSQLiteImp);

  @override
  Future<bool> call(
      ConfigurationPreferenceDTO configurationPreferenceDTO) async {
    final databaseResponse = await _getDatabaseSQLiteImp();
    const sql = '''
        UPDATE configuration_preference SET 
        theme_mode = ?
        language = ?
      ''';
    try {
      final updateResponse = await databaseResponse.rawUpdate(
        sql,
        [
          configurationPreferenceDTO.themeMode,
          configurationPreferenceDTO.language,
        ],
      );
      return updateResponse != 0 ? true : false;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
