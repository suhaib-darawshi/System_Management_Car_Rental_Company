import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Widgets/AllCarLists.dart';
import 'package:rental_management_app/providers/provider.dart';

class DailyStock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(
      builder: (context,provider,child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    if (context.locale == Locale('en')) {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  },
                  icon: Icon(Icons.language))
            ],
            title: Center(child: Text("Daily Stock".tr(),style: TextStyle(color: Colors.black),)),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              Container(
                height: 50.h,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                    Text("Free".tr()+" : "+provider.carInPlace.length.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.h),),
                    Text("Total".tr()+" : "+provider.carList.length.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.h)),
                    Text("Usage".tr()+" : "+(provider.carInRental.length*100/provider.carList.length).toString()+' %',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.h))

                    ]
                  ),
                ),
              )
              ,
              Expanded(
                child: AllCars()
                ),
            ],
          ),
        );
      }
    );
  }
}
