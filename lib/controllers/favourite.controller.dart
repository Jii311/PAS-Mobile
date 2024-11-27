import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_11/models/api_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Likecontroller extends GetxController {
  static Database? _db;
  // list data yang digunakan untuk menampun hasil database, .obs diguanakan di UI
  var tasks = <ApiModel>[].obs;
  var isLiked = false.obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            idTeam TEXT, 
            strTeam TEXT, 
            strBadge TEXT,
            strTeamAlternate TEXT,
            strLeague TEXT,
            strStadium TEXT,
            strLocation TEXT,
            strDescriptionEN TEXT,
            isLiked INTEGER 
          )
        ''');
      },
    );
  }

  // Insert Task
  Future<int> addTask(ApiModel task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    return result;
  }

  // Retrieve Tasks
  Future<void> loadTasks() async {
    var dbClient = await db; // nyambungin
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(queryResult.map((data) => ApiModel.fromMap(data)).toList());
  }

  Future<void> deleteTask(String idTeam) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'idTeam = ?', whereArgs: [idTeam]);
    loadTasks();
  }

  Rx<bool> getLikedById(String idTeam) {
    for (var model in tasks) {
      if (model.idTeam == idTeam) {
        return true.obs; // Return the isLiked status if id matches
      }
    }
    return false.obs; // Return false if no matching id is found
  }
}
