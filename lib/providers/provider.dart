import 'package:flutter/cupertino.dart';
import 'package:rental_management_app/data/sqlhelper.dart';

import '../models/car.dart';
import '../models/user.dart';

class CarProvider extends ChangeNotifier {
  List<User> usersList = [];
  List<Car> carList = [];
  CarProvider() {
    getCars();
    getUsers();
  }
  getUsers() async {
    usersList = await SQL.sql.getUsers();
  }

  getCars() async {
    carList = await SQL.sql.getAllCars();
  }
}
