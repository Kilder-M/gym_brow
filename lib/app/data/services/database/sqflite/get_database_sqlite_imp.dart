import 'package:gymbrow/app/data/services/database/get_database.dart';
import 'package:gymbrow/app/data/services/database/sqflite/sqlite_script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GetDatabaseSQLiteImp implements GetDatabase {
  
  @override
  Future<Database> call() async {
    String path = join(await getDatabasesPath(), 'gymbrow');
    // deleteDatabase(path);
    final Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(createWorkoutTable);
        db.execute(createConfigurationPreference);
        db.execute(initialConfigurationPreference);
        db.execute(insertWorkoutTest);
      },
    );
    return database;
  }
}
