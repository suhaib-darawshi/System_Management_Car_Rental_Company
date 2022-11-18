import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Screens/ServiceScreens/CarDetails.dart';
import 'package:rental_management_app/providers/provider.dart';

import '../../models/car.dart';

class CarWidget extends StatelessWidget {
  late Car car;
  late String category;
  late String Licence;
  late String location;
  late String status;
  late String branch;
  late String carin;
  CarWidget(this.car) {
    category = car.category;
    Licence = car.licence;
    location = car.carLocation;
    status = car.status;
    branch = car.branch;
    carin = car.carIn;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width / 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.people_rounded), Text('1')],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.access_time), Text('1')],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 6 / 7.0,
            color: (car.damages != "No damages" ||
                    car.carIn != "Car Out" ||
                    car.toBePrepared != 1)
                ? Colors.red
                : Colors.amber,
            child: ListTile(
              title: Text(
                'Category:$category\nLicence Place: $Licence\nCar Location: $location\nStatus: $status\nBranch:$branch\n$carin ,Service',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Provider.of<CarProvider>(context, listen: false)
                    .setCurrent(car);
                Navigator.of(context).pushNamed('Details');
              },
            ),
          ),
        ],
      ),
    );
  }
}
