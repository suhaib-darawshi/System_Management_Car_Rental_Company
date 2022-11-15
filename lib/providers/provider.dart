import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_management_app/data/sqlhelper.dart';

import '../models/car.dart';
import '../models/user.dart';

class CarProvider extends ChangeNotifier {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  // List<Widget> listTiles = [ListTile(
  //   title: Text("My Tasks".tr()),
  // ),
  //           ListTile(
  //             title: Text("My Tasks".tr()),
  //           ),
  //           ListTile(
  //             title: Text("My Tasks".tr()),
  //           ),
  //           ListTile(
  //             title: Text("My Tasks".tr()),
  //           ),
  //           ListTile(
  //             title: Text("My Tasks".tr()),
  //           ),
  //           ListTile(
  //             title: Text("My Tasks".tr()),
  //           ),
  //           ];
  List<User> usersList = [];
  List<Car> carList = [];
  List<Car> brokenCars = [];
  List<Car> fixedCars = [];
  CarProvider() {
    getCars();
    getUsers();
  }
  getUsers() async {
    usersList = await SQL.sql.getUsers();
    brokenCars = carList.where((element) => element.toBePrepared == 1).toList();
    fixedCars = carList.where((element) => element.toBePrepared == 1).toList();
  }

  getCars() async {
    carList = await SQL.sql.getAllCars();
  }

  logIn() {
    String email = emailController.text;
    String password = passwordController.text;
    int auth = 0;
    for (var element in usersList) {
      if (email == element.Email) {
        if (password == element.password) {
          auth = 1;
          break;
        }
      }
    }
    return auth;
  }
}
