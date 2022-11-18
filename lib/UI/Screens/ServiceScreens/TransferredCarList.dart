import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_management_app/UI/Widgets/TransferredCars.dart';

class TransferredScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              actions: [IconButton(onPressed: (() {
          if(context.locale==Locale('en')){
            context.setLocale(Locale('ar'));
          }
          else{
            context.setLocale(Locale('en'));
          }
        }), icon: Icon(Icons.language))],
              title: Center(child: Text("To Be Transferred".tr(),style: TextStyle(color: Colors.black),)),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
                onPressed: () => Navigator.of(context).pop(),
              ),),
              body: TransferredCarsList(),

    );
  }
}