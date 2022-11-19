import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Screens/ServiceScreens/DailyStock.dart';
import 'package:rental_management_app/UI/Screens/ServiceScreens/DailyTasks.dart';
import 'package:rental_management_app/UI/Screens/ServiceScreens/DamagedListScreen.dart';
import 'package:rental_management_app/UI/Screens/ServiceScreens/TransferredCarList.dart';
import 'package:rental_management_app/UI/Widgets/AllCarLists.dart';
import 'package:rental_management_app/UI/Widgets/BrokenCarList.dart';
import 'package:rental_management_app/UI/Widgets/FixedCars.dart';
import 'package:rental_management_app/data/dummy.dart';
import 'package:rental_management_app/providers/provider.dart';

import 'AddCarPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 8.w,
                    top: 40.h,
                    right: MediaQuery.of(context).size.width / 3),
                child: Image.asset(
                  'assets/images/logo.PNG',
                  width: 180.w,
                  height: 180.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                        child: Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Text("My Tasks".tr()))),
                    const Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("Daily Tasks".tr())),
                      onTap: () {
                        Navigator.of(context).pushNamed('Daily Tasks');
                      },
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("Daily Stock".tr())),
                      onTap: () {
                        Navigator.of(context).pushNamed('DailY Stock');
                      },
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                        child: Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Text("Scan Code".tr()))),
                    const Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("Search Car".tr())),
                      onTap: () {
                        Navigator.of(context).pushNamed('SearchCar');
                      },
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("To Be Prepared".tr())),
                      onTap: () {
                        Navigator.of(context).pushNamed('Damaged');
                      },
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("To Be Transferred".tr())),
                      onTap: () {
                        Navigator.of(context).pushNamed('Transferred');
                      },
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("Log Out".tr())),
                      onTap: (() {
                        Navigator.of(context).pushReplacementNamed('Login');
                      }),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (() {
                  if (context.locale == Locale('en')) {
                    context.setLocale(Locale('ar'));
                  } else {
                    context.setLocale(Locale('en'));
                  }
                }),
                icon: Icon(Icons.language))
          ],
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Home Page'.tr(),
              style: TextStyle(color: Colors.black),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          bottom: TabBar(tabs: [
            Text('All Cars'.tr(), style: TextStyle(color: Colors.black)),
            Text('Broken cars'.tr(), style: TextStyle(color: Colors.black)),
            Text('Fixed Cars'.tr(), style: TextStyle(color: Colors.black))
          ]),
        ),
        body: TabBarView(
          children: [AllCars(), BrokenCars(), FixedCars()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<CarProvider>(context, listen: false).clearTexts();
            Navigator.of(context).pushNamed('Add Car');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
