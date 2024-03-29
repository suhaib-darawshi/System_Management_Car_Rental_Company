import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_management_app/data/dummy.dart';
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
  TextEditingController carStatusController = TextEditingController();
  TextEditingController carDamagesController = TextEditingController();
  bool carPrepared = false;
  bool carTransferred = false;

  List<User> usersList = [];
  List<Car> carList = [];
  List<Car> brokenCars = [];
  List<Car> fixedCars = [];
  List<Car> carInPlace = [];
  List<Car> carInRental = [];
  String? name;
  CarProvider() {
    getCars();
    getUsers();
  }

  addCar() async {
    Map<String, dynamic> map = {
      'Car_Name':
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
      'Fuel_Status':
          carFuelController.text == "" ? "Not Defined" : carFuelController.text,
      'Tyres':
          carTyresController.text == "" ? "Undefined" : carTyresController.text,
      'Barking_Box': carParkingController.text == ""
          ? "not selected"
          : carParkingController.text,
      'Damages': "No damages",
      'Car_In': "Car In",
      'Car_Location': carLocationController.text == ""
          ? "Unselected"
          : carLocationController.text,
      'To_Be_Prepared': 0,
      'To_Be_Transferred': 0
    };

    await SQL.sql.addCar(Car.fromMap(map));
    getCars();
    notifyListeners();
  }

  prepared() {
    carPrepared = !carPrepared;
    notifyListeners();
  }

  transferred() {
    carTransferred = !carTransferred;
    notifyListeners();
  }

  clearTexts() {
    carBrancdController.clear();
    carBranchController.clear();
    carCategoryController.clear();
    carDamagesController.clear();
    carFuelController.clear();
    carKilometersController.clear();
    carLicenceController.clear();
    carLocationController.clear();
    carModelController.clear();
    carNameController.clear();
    carVINController.clear();
    carParkingController.clear();
    carStatusController.clear();
    carTyresController.clear();
  }

  getUsers() async {
    usersList = await SQL.sql.getUsers();

    log(usersList.length.toString());
  }

  getCars() async {
    carList = await SQL.sql.getAllCars();
    carList.map((e) {
      log(e.carName);
    });
    carInPlace = carList.where((element) => element.carIn == "Car In").toList();
    carInRental =
        carList.where((element) => element.carIn != "Car In").toList();
    brokenCars = carList.where((element) => element.toBePrepared == 1).toList();
    fixedCars = carList.where((element) => element.toBePrepared == 0).toList();
    cars = carList.where((element) => element.carName == name).toList();
    notifyListeners();
  }

  loadValues() {
    carBrancdController.text = CAR.brand;
    carBranchController.text = CAR.branch;
    carCategoryController.text = CAR.category;
    carFuelController.text = CAR.fuelStatus;
    carKilometersController.text = CAR.kilometers.toString();
    carLicenceController.text = CAR.licence;
    carLocationController.text = CAR.carLocation;
    carModelController.text = CAR.model;
    carNameController.text = CAR.carName;
    carParkingController.text = CAR.barkingBox;
    carTyresController.text = CAR.tyres;
    carVINController.text = CAR.VIN;
    carDamagesController.text = CAR.damages;
    carStatusController.text = CAR.status;
    carPrepared = CAR.toBePrepared == 0 ? false : true;
    carTransferred = CAR.toBeTransferred == 0 ? false : true;
  }

  updateCar() async {
    Map<String, dynamic> map = {
      'id': CAR.id,
      'Car_Name':
          carNameController.text == "" ? "No Name" : carNameController.text,
      'Status': carStatusController.text,
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
      'Fuel_Status':
          carFuelController.text == "" ? "Not Defined" : carFuelController.text,
      'Tyres':
          carTyresController.text == "" ? "Undefined" : carTyresController.text,
      'Barking_Box': carParkingController.text == ""
          ? "not selected"
          : carParkingController.text,
      'Damages': carDamagesController.text,
      'Car_In': CAR.carIn,
      'Car_Location': carLocationController.text == ""
          ? "Unselected"
          : carLocationController.text,
      'To_Be_Prepared': carPrepared ? 1 : 0,
      'To_Be_Transferred': carTransferred ? 1 : 0
    };
    await SQL.sql.updateCar(Car.fromMap(map));
    getCars();
    notifyListeners();
  }

  Car CAR = Car.fromMap(cardata);
  setCurrent(Car car) {
    CAR = car;

    // notifyListeners();
  }

  getCurrent() {
    return CAR;
  }

  List<Car> cars = [];
  clearSearchList() {
    cars = [];
    clearTexts();
  }

  searchCar() {
    name = carNameController.text;

    log(name ?? 'asd');
    getCars();
    log(cars.length.toString());
    notifyListeners();
  }

  contract() async {
    if (CAR.carIn == "Car In") {
      CAR.carIn = "Car Out";
      CAR.status = "Contract In";
    } else {
      CAR.carIn = "Car In";
      CAR.status = "Contract Out";
    }

    await SQL.sql.updateCar(CAR);
    getCars();
    notifyListeners();
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
