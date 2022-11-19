import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Widgets/ViewCarWidget.dart';
import 'package:rental_management_app/providers/provider.dart';

class SearchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<CarProvider>(context).cars.length,
      itemBuilder: (context, index) {
        return CarWidgetForUpdate(
            Provider.of<CarProvider>(context).cars[index]);
      },
    );
  }
}
