import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:rental_management_app/models/car.dart';
import 'package:rental_management_app/models/user.dart';
import 'package:sqflite/sqflite.dart';

class SQL {
  final String carTableName = 'Cars';
  final String carIdColumnName = 'id';
  final String carNameColumnName = 'Car_Name';
  final String carStatusColumnName = 'Status';
  final String carBrandColumnName = 'Brand';
  final String carLicencePlateColumnName = 'Licence';
  final String carVinColumnName = 'VIN';
  final String carCategoryColumnName = 'Category';
  final String carBranchColumnName = 'Branch';
  final String carKilometersColumnName = 'Kilometers';
  final String carFuelStatusColumnName = 'Fuel_Status';
  final String carTyresColumnName = 'Tyres';
  final String carParkingBoxColumnName = 'Barking_Box';
  final String carDamagesColumnName = 'Damages';
  final String carCarInColumnName = 'Car_In';
  final String carLocationColumnName = 'Car_Location';
  final String usersTableName = 'Users';
  final String usersIdColumnName = 'User_id';
  final String userUsernameColumnName = 'Username';
  final String userEmailColumnName = 'Email';
  final String userPasswordColumnName = 'Password';
  final String userRoleColumnName = 'User_Role';
  final String carModelColumnName = 'Model';
  final String carToBePreparedColumnName = 'To_Be_Prepared';
  final String carToBeTransferredColumnName = 'To_Be_Transferred';

  SQL._();
  static SQL sql = SQL._();
  late Database dataBase;
  initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/$carTableName';

    dataBase =
        await openDatabase(path, version: 1, onCreate: ((db, version) async {
      await db.execute('''
      CREATE TABLE $carTableName (
        $carIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
        $carNameColumnName TEXT,
        $carStatusColumnName TEXT,
        $carBrandColumnName TEXT,
        $carLicencePlateColumnName TEXT,
        $carVinColumnName TEXT,
        $carCategoryColumnName TEXT,
        $carBranchColumnName TEXT,
        $carKilometersColumnName INTEGER,
        $carFuelStatusColumnName TEXT,
        $carTyresColumnName TEXT,
        $carParkingBoxColumnName TEXT,
        $carDamagesColumnName TEXT,
        $carLocationColumnName TEXT,
        $carModelColumnName TEXT,
        $carCarInColumnName TEXT,
        $carToBePreparedColumnName INTEGER,
        $carToBeTransferredColumnName INTEGER
      )

''');
      await db.execute('''
    CREATE TABLE $usersTableName (
        $usersIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
        $userUsernameColumnName TEXT,
        $userEmailColumnName TEXT,
        $userPasswordColumnName TEXT,
        $userRoleColumnName TEXT)''');
      log("database created");
    }), onOpen: (db) {
      log('database opened');
    }, onUpgrade: ((db, oldVersion, newVersion) async {
      await db.execute('''
      CREATE TABLE $carTableName (
        $carIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
        $carNameColumnName TEXT,
        $carStatusColumnName TEXT,
        $carBrandColumnName TEXT,
        $carLicencePlateColumnName TEXT,
        $carVinColumnName TEXT,
        $carCategoryColumnName TEXT,
        $carBranchColumnName TEXT,
        $carKilometersColumnName INTEGER,
        $carFuelStatusColumnName TEXT,
        $carTyresColumnName TEXT,
        $carParkingBoxColumnName TEXT,
        $carDamagesColumnName TEXT,
        $carLocationColumnName TEXT,
        $carModelColumnName TEXT,
        $carToBePreparedColumnName INTEGER,
        $carToBeTransferredColumnName INTEGER
      )

''');
await db.execute('''
    CREATE TABLE $usersTableName (
        $usersIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
        $userUsernameColumnName TEXT,
        $userEmailColumnName TEXT,
        $userPasswordColumnName TEXT,
        $userRoleColumnName TEXT)''');
    }));
  }

  Future<List<Car>> getAllCars() async {
    List<Map<String, Object?>> ob = await dataBase.query(carTableName);
    return ob.map((e) => Car.fromMap(e)).toList();
  }

  Future<List<User>> getUsers() async {
    List<Map<String, Object?>> ob = await dataBase.query(usersTableName);
    return ob.map((e) => User.fromMap(e)).toList();
  }

  addUser(User u) {
    dataBase.insert(usersTableName, u.toMap());
  }

  addCar(Car c) {
    dataBase.insert(carTableName, c.toMap());
  }

  updateCar(Car c) {
    dataBase.update(
        carTableName,
        {
          carCarInColumnName: c.carIn,
          carToBePreparedColumnName:c.toBePrepared,
          carToBeTransferredColumnName:c.toBeTransferred,
          carDamagesColumnName:c.damages
        },
        where: 'id=?',
        whereArgs: [c.id]);
  }
}
