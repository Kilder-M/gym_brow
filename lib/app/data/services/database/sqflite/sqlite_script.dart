const createWorkoutTable = '''
      CREATE TABLE workout(
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
        ,name VARCHAR[400] NOT NULL
        ,series INTEGER NOT NULL
        ,repetitions INTEGER NOT NULL
        ,rest_time REAL NOT NULL
        ,weight REAL NOT NULL
        ,is_done INTEGER NOT NULL
        ,image_url TEXT
        ,weekday INTEGER NOT NULL
      )
''';

const insertWorkoutTest = '''
  INSERT INTO workout(id,name,series,repetitions,rest_time,weight,is_done,image_url,weekday)
  VALUES(1,'Crucifixo invertido',3,12,1.40,30.0,0,'asdasdasdasdasd.com','5')
''';
