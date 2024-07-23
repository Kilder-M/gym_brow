const createWorkoutTable = '''
      CREATE TABLE workout(
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
        ,name VARCHAR[400] NOT NULL
        ,series INTEGER NOT NULL
        ,repetitions INTEGER NOT NULL
        ,rest_time REAL 
        ,weight REAL
        ,is_done INTEGER
        ,image_url TEXT
        ,weekday INTEGER NOT NULL
        ,observations TEXT
      )
''';

const createConfigurationPreference = '''

  CREATE TABLE configuration_preference(
  theme_mode INTEGER
  ,language VARCHAR[6]
)
''';

const initialConfigurationPreference = '''
  INSERT INTO configuration_preference (theme_mode,language) VALUES (0,'pt-br')
''';

const insertWorkoutTest = '''
  INSERT INTO workout(id,name,series,repetitions,rest_time,weight,is_done,image_url,weekday,observations)
  VALUES(1,'Crucifixo invertido',3,12,1.40,30.0,0,'asdasdasdasdasd.com','5','observations')
''';
