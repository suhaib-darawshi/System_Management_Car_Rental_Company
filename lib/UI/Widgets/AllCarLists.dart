import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Widgets/CarWidget.dart';

import '../../providers/provider.dart';
import 'ViewCarWidget.dart';

class AllCars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: Provider.of<CarProvider>(context).carList.length,
          itemBuilder: (context, index) {
            return CarWidgetForUpdate(Provider.of<CarProvider>(context).carList[index]);
          },
        );
     
  }
}
