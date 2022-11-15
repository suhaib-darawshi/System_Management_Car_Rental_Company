import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Screens/ServiceScreens/DailyTasks.dart';
import 'package:rental_management_app/UI/Widgets/AllCarLists.dart';
import 'package:rental_management_app/UI/Widgets/BrokenCarList.dart';
import 'package:rental_management_app/UI/Widgets/FixedCars.dart';
import 'package:rental_management_app/providers/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late TabController tabController;
  
  @override
  void initState(){
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DailyTasks();
                      }));
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("Daily Stock".tr()))),
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
                          child: Text("Search Car".tr()))),
                  const Divider(
                    color: Colors.black,
                  ),
                  InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("To Be Prepared".tr()))),
                  const Divider(
                    color: Colors.black,
                  ),
                  InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("To Be Transferred".tr()))),
                  const Divider(
                    color: Colors.black,
                  ),
                  InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text("Log Out".tr()))),
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
        backgroundColor: Colors.white,
        title: Center(child: Text('Home Page'.tr()),),
        iconTheme: IconThemeData(color: Colors.black),
        bottom: TabBar(controller: tabController,tabs: [
          Text('All Cars'.tr()),
          Text('Broken cars'.tr()),
          Text('Fixed Cars'.tr())
        ]),
      ),
      body: TabBarView(controller: tabController,
      children: [
        AllCars(),
        BrokenCars(),
        FixedCars()
      ],),
    );
  }
}