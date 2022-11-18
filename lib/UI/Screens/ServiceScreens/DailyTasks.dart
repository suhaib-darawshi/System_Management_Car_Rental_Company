import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Widgets/CarIn.dart';
import 'package:rental_management_app/UI/Widgets/CarOut.dart';
import 'package:rental_management_app/main.dart';

import '../AddCarPage.dart';

class DailyTasks extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              actions: [IconButton(onPressed: (() {
          if(context.locale==Locale('en')){
            context.setLocale(Locale('ar'));
          }
          else{
            context.setLocale(Locale('en'));
          }
        }), icon: Icon(Icons.language))],
              title: Center(child: Text("Daily Tasks".tr(),style: TextStyle(color: Colors.black),)),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
                onPressed: () => Navigator.of(context).pop(),
              ),
              bottom: TabBar( tabs: [
            
            Text('IN'.tr(),style: TextStyle(color: Colors.black)),
            Text('OUT'.tr(),style: TextStyle(color: Colors.black))
          ]),
            
            ),
            body:  TabBarView(
          
          children: [CarIn(), CarOut()],
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
        
          ),
        );
      },
    );
  }
}
