import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:rental_management_app/models/car.dart';
import 'package:rental_management_app/models/user.dart';
import 'package:sqflite/sqflite.dart';

class SQL {
  final String carTableName = 'Cars';
  final String carIdColumnName = 'id';
  final String carNameColumnName = 'Car Name';
  final String carStatusColumnName = 'Status';
  final String carBrandColumnName = 'Brand';
  final String carLicencePlateColumnName = 'Licence';
  final String carVinColumnName = 'VIN';
  final String carCategoryColumnName = 'Category';
  final String carBranchColumnName = 'Branch';
  final String carKilometersColumnName = 'Kilometers';
  final String carFuelStatusColumnName = 'Fuel Status';
  final String carTyresColumnName = 'Tyres';
  final String carParkingBoxColumnName = 'Barking Box';
  final String carDamagesColumnName = 'Damages';
  final String carCarInColumnName = 'Car In';
  final String carLocationColumnName = 'Car Location';
  final String usersTableName = 'Users';
  final String usersIdColumnName = 'id';
  final String userUsernameColumnName = 'Username';
  final String userEmailColumnName = 'Email';
  final String userPasswordColumnName = 'Password';
  final String userRoleColumnName = 'User Role';

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
        $carIdColumnName INTEGER primary key autoincrement,
        $carNameColumnName varchar(50),
        $carStatusColumnName INTEGER,
        $carBrandColumnName varchar(50),
        $carLicencePlateColumnName varchar(50),
        $carVinColumnName varchar(50),
        $carCategoryColumnName varchar(50),
        $carBranchColumnName varchar(50),
        $carKilometersColumnName INTEGER,
        $carFuelStatusColumnName varchar(50),
        $carTyresColumnName varchar(50),
        $carParkingBoxColumnName varchar(50),
        $carDamagesColumnName varchar(50),
        $carLocationColumnName varchar(50)
      )

''');
      await db.execute('''
    CREATE TABLE $usersTableName (
        $usersIdColumnName INTEGER primary key autoincrement,
        $userUsernameColumnName varchar(50),
        $userEmailColumnName varchar(50),
        $userPasswordColumnName varchar(50),
        $userRoleColumnName varchar(50)''');
      log("database created");
    }), onOpen: (db) {
      log('database opened');
    }, onUpgrade: ((db, oldVersion, newVersion) async {
      await db.execute('''
      CREATE TABLE $carTableName (
        $carIdColumnName INTEGER primary key autoincrement,
        $carNameColumnName varchar(50),
        $carStatusColumnName INTEGER,
        $carBrandColumnName varchar(50),
        $carLicencePlateColumnName varchar(50),
        $carVinColumnName varchar(50),
        $carCategoryColumnName varchar(50),
        $carBranchColumnName varchar(50),
        $carKilometersColumnName INTEGER,
        $carFuelStatusColumnName varchar(50),
        $carTyresColumnName varchar(50),
        $carParkingBoxColumnName varchar(50),
        $carDamagesColumnName varchar(50),
        $carLocationColumnName varchar(50)
      )

''');
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
  


}
