import 'package:sqflite/sqflite.dart';
class LoginDataBase{
  LoginDataBase._();

  static final LoginDataBase instance = LoginDataBase._();
  static Database _database;

  Future<Database> get database async{
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB()async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(),'login_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE login(email TEXT PRIMARY KEY,motdepasse TEXT, nom TEXT, prenom TEXT)"
        );
      },
      version: 1,
    );
  }
  void insertRecipe(Login login) async{
    final Database db = await database;

    await db.insert(
      'recipe',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // 8:19
  }
}