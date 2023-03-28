import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = 'monsters_inc_phrases.db';
  static final _databaseVersion = 1;

  static final table = 'favoris';
  static final columnId = 'id';
  static final columnBackgroundColor = 'backgroundColor';
  static final columnShadowColor = 'shadowColor';
  static final columnImageAssetPath = 'imageAssetPath';
  static final columnNomPersonnage = 'nomPersonnage';
  static final columnTexteReplique = 'texteReplique';
  static final columnAudio = 'audio';
  static final columnFavori = 'favori';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // open the database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnBackgroundColor INTEGER NOT NULL,
            $columnShadowColor INTEGER NOT NULL,
            $columnImageAssetPath TEXT NOT NULL,
            $columnNomPersonnage TEXT NOT NULL,
            $columnTexteReplique TEXT NOT NULL,
            $columnAudio TEXT NOT NULL,
            $columnFavori INTEGER NOT NULL
          )
          ''');
  }

  // Helper methods

  Future<List<Map<String, dynamic>>> queryFavoris() async {
  final db = await instance.database;
  return await db.query(table, where: 'favori = ?', whereArgs: [1]);
}

  // Insert a row
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // Delete a row
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  // Get all rows
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}
