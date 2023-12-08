import 'package:nesto/models/customer.dart';
import 'package:nesto/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBEmployeeManager {
  Future<void> storeDataInDatabase(List<Customer> employees) async {
    final Database database = await openDatabase(
        join(await getDatabasesPath(), "customer.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE Customers (
        id INTEGER PRIMARY KEY,
        idd TEXT,
        name TEXT,
        profilePic TEXT,
        mobileNumber TEXT,
        email TEXT,
        street TEXT,
        streetTwo TEXT,
        city TEXT,
        pincode INTEGER,
        country TEXT,
        state TEXT,
        createdDate TEXT,
        createdTime TEXT,
        modifiedDate TEXT,
        modifiedTime TEXT,
        flag INTEGER
      )
      ''');
    });

    for (final employee in employees) {
      await database.insert(
        'Customers',
        employee.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
  Future<void> storeDataInDatabase1(List<Product> employees) async {
    final Database database = await openDatabase(
        join(await getDatabasesPath(), "product.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE product (
        id INTEGER PRIMARY KEY,
        idd INTEGER,
        name TEXT,
        image TEXT,
        price REAL,
        created_date TEXT,
        created_time TEXT,
        modified_date TEXT,
        modified_time TEXT,
        flag INTEGER
      )
    ''');
    });

    for (final employee in employees) {
      await database.insert(
        'product',
        employee.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
