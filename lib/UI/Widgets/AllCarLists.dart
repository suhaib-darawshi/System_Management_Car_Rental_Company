import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Widgets/CarWidget.dart';

import '../../providers/provider.dart';

class AllCars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.carList.length,
          itemBuilder: (context, index) {
            return CarWidget(provider.carList[index]);
          },
        );
      },
    );
  }
}
