import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/main.dart';

class DailyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Daily Tasks".tr(),style: TextStyle(color: Colors.black),)),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
              onPressed: () => Navigator.of(context).pop(),
            ),
            
          
          ),
        );
      },
    );
  }
}
