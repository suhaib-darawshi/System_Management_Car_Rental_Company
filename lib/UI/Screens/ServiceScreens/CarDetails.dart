import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/providers/provider.dart';

import '../../../models/car.dart';

class CarDetails extends StatelessWidget {
  late Car car;
  
    
  

  @override
  Widget build(BuildContext context) {
    this.car = Provider.of<CarProvider>(context).getCurrent();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'Car Details'.tr(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Card(
          elevation: 8,
          child: Container(
            height: 550.h,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        car.licence,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.h),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.h),
                            ),
                            Text('Brand:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text('Model:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text('Licence Plate:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text('Vin:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text(
                              'Category:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.h),
                            ),
                            Text('Branch:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text('Kilometers:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text('Fuel Status:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text('Tyres:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text('Parking Box:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.status,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.h),
                            ),
                            Text(car.brand,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text(car.model,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text(car.licence,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text(car.VIN,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text(
                              car.category,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.h),
                            ),
                            Text(car.branch,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text(car.kilometers.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text(car.fuelStatus,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text(car.tyres,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                            Text(car.barkingBox,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.h)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Damages',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.h),
                          ),
                          Text(car.damages),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Actions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.h),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Provider.of<CarProvider>(context, listen: false)
                                    .contract();
                              },
                              child: Text(Provider.of<CarProvider>(context).CAR.carIn=='Car In'
                                  ? 'Contract In'
                                  : 'Contract Out'))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
