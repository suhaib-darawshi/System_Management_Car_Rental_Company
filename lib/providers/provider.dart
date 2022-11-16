import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_management_app/data/sqlhelper.dart';

import '../models/car.dart';
import '../models/user.dart';

class CarProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController carNameController = TextEditingController();
  TextEditingController carBrancdController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carLicenceController = TextEditingController();
  TextEditingController carVINController = TextEditingController();
  TextEditingController carCategoryController = TextEditingController();
  TextEditingController carBranchController = TextEditingController();
  TextEditingController carKilometersController = TextEditingController();
  TextEditingController carFuelController = TextEditingController();
  TextEditingController carTyresController = TextEditingController();
  TextEditingController carParkingController = TextEditingController();
  TextEditingController carLocationController = TextEditingController();
  addCar() {
    Map<String, dynamic> map = {
      'Car Name':
          carNameController.text == "" ? "No Name" : carNameController.text,
      'Status': 'Contract In',
      'Brand': carBrancdController.text == ""
          ? "No Brand"
          : carBrancdController.text,
      'Model':
          carModelController.text == "" ? "No Model" : carModelController.text,
      'Licence': carLicenceController.text == ""
          ? "No Licence"
          : carLicenceController.text,
      'VIN': carVINController.text == "" ? "VIN" : carVINController.text,
      'Category': carCategoryController.text == ""
          ? "No Category"
          : carCategoryController.text,
      'Branch': carBranchController.text == ""
          ? "No Branch"
          : carBranchController.text,
      'Kilometers': carKilometersController.text == ""
          ? 0
          : int.parse(carKilometersController.text),
      'Fuel Status':
          carFuelController.text == "" ? "Not Defined" : carFuelController.text,
      'Tyres':
          carTyresController.text == "" ? "Undefined" : carTyresController.text,
      'Barking Box': carParkingController.text == ""
          ? "not selected"
          : carParkingController.text,
      'Damages': "No damages",
      'Car In': "Car In",
      'Car Location': carLocationController.text == ""
          ? "Unselected"
          : carLocationController.text,
      'To Be Prepared': 0,
      'To Be Transferred': 0
    };

    SQL.sql.addCar(Car.fromMap(map));
  }

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
    log(email);
    log(password);
    int auth = 0;
    for (var element in usersList) {
      log(element.Email);
      log(element.password);
      if (email == element.Email) {
        if (password == element.password) {
          return 1;
        }
        return 2;
      }
    }
    return auth;
  }
}
