import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/car.dart';
import '../../providers/provider.dart';

class UpdateCar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Car".tr()),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer<CarProvider>(builder: (context, provider, child) {
            
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Car Name".tr()),
                          controller: provider.carNameController,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Brand".tr()),
                          controller: provider.carBrancdController,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Model".tr()),
                          controller: provider.carModelController,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Licence".tr()),
                          controller: provider.carLicenceController,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "VIN".tr()),
                          controller: provider.carVINController,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Category".tr()),
                          controller: provider.carCategoryController,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Branch".tr()),
                          controller: provider.carBranchController,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "kilometers".tr()),
                          controller: provider.carKilometersController,
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Fuel Status".tr()),
                          controller: provider.carFuelController,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Tyres".tr()),
                          controller: provider.carTyresController,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Barking Box".tr()),
                          controller: provider.carParkingController,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Location".tr()),
                          controller: provider.carLocationController,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Damages".tr()),
                          controller: provider.carDamagesController,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Status".tr()),
                          controller: provider.carStatusController,
                        ),
                        CheckboxListTile(
                          title: Text("To Be Prepared".tr()),
                            value: provider.carPrepared,
                            onChanged: (v) {
                              provider.carPrepared = !provider.carPrepared;
                            }),
                             CheckboxListTile(
                            title: Text("To Be Transferred".tr() ),
                            value: provider.carTransferred,
                            onChanged: (v) {
                              provider.carPrepared = !provider.carTransferred;
                            })
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        provider.updateCar();
                      },
                      child: Text("Update".tr()))
                ],
              ),
            );
          })
        
    );
  }
}
