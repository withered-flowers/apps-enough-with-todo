import 'package:enough_with_todo/data/data.dart';
import 'package:enough_with_todo/utils/utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();

  factory TaskDatasource() => _instance;

  TaskDatasource._() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task.db');

    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DbKeys.dbTable} (
        ${DbKeys.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DbKeys.titleColumn} TEXT,
        ${DbKeys.noteColumn} TEXT,
        ${DbKeys.dateColumn} TEXT,
        ${DbKeys.timeColumn} TEXT,
        ${DbKeys.categoryColumn} TEXT,
        ${DbKeys.isCompletedColumn} INTEGER
      )
    ''');
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        DbKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        DbKeys.dbTable,
        task.toJson(),
        where: '${DbKeys.idColumn} = ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(
        DbKeys.dbTable,
        where: '${DbKeys.idColumn} = ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      DbKeys.dbTable,
      orderBy: '${DbKeys.idColumn} DESC',
    );

    return List.generate(maps.length, (i) => Task.fromJson(maps[i]));
  }
}
