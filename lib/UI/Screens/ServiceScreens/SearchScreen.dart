import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/providers/provider.dart';

import '../../../models/car.dart';

class SearchCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CarProvider>(context,listen: false).clearSearchList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Search Car".tr()),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
      ),
      body: Column(
        children: [
          TextFormField(
                        decoration: InputDecoration(labelText: "Car Name".tr()),
                        controller: Provider.of<CarProvider>(context).carNameController,
                      ),
          ElevatedButton(
            child: Text("Search Car".tr()),
            onPressed: () {
              Provider.of<CarProvider>(context, listen: false).searchCar();
            },
          ),
          Expanded(child: SearchCar())
        ],
      ),
    );
  }
}
