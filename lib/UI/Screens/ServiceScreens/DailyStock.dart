import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/AllCarLists.dart';
import '../../Widgets/BrokenCarList.dart';
import '../../Widgets/FixedCars.dart';
import '../AddCarPage.dart';

class DailyStock extends StatefulWidget {

  @override
  State<DailyStock> createState() => _DailyStockState();
}

class _DailyStockState extends State<DailyStock> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Home Page'.tr(),style: TextStyle(color: Colors.black),),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        bottom: TabBar(controller: tabController, tabs: [
          Text('All Cars'.tr(),style: TextStyle(color: Colors.black)),
          Text('Broken cars'.tr(),style: TextStyle(color: Colors.black)),
          Text('Fixed Cars'.tr(),style: TextStyle(color: Colors.black))
        ]),
      ),
      body: TabBarView(
        controller: tabController,
        children: [AllCars(), BrokenCars(), FixedCars()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddCarPage();
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      
    );
  }
}