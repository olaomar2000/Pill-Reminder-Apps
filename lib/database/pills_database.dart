import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PillsDatabase{

  setDatabase() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,"pills_db");
    Database database = await openDatabase(path,version: 1,onCreate: (Database db,int version)async{
      await db.execute("CREATE TABLE Pills (id INTEGER PRIMARY KEY, name TEXT,  type TEXT, medicineForm TEXT, time INTEGER)");
    });
    return database;
  }

}