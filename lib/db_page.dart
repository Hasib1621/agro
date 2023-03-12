import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('example.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Rices (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phone TEXT
      )
    ''');
  }

  Future<int> createRice(Rice Rice) async {
    final db = await instance.database;
    return await db.insert('Rices', Rice.toMap());
  }

  Future<Rice> readRice(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'Rices',
      columns: ['id', 'name', 'phone'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Rice.fromMap(maps.first);
    } else {
      throw Exception('Rice not found');
    }
  }

  Future<List<Rice>> readAllRices() async {
    final db = await instance.database;

    const orderBy = 'name ASC';
    final result = await db.query('Rices', orderBy: orderBy);

    return result.map((map) => Rice.fromMap(map)).toList();
  }

  Future<int> updateRice(Rice Rice) async {
    final db = await instance.database;

    return db.update(
      'Rices',
      Rice.toMap(),
      where: 'id = ?',
      whereArgs: [Rice.id],
    );
  }

  Future<int> deleteRice(int id) async {
    final db = await instance.database;

    return await db.delete(
      'Rices',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class Rice {
  final int? id;
  final String name;
  final String phone;

  Rice({this.id, required this.name, required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }

  static Rice fromMap(Map<String, dynamic> map) {
    return Rice(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
    );
  }
}
