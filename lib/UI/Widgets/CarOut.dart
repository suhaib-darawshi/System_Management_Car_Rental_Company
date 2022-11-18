import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Widgets/CarWidget.dart';

import '../../providers/provider.dart';


class CarOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: Provider.of<CarProvider>(context).carInRental.length,
          itemBuilder: (context, index) {
            return CarWidget(Provider.of<CarProvider>(context).carInRental[index]);
          },
        );
     
  }
}
