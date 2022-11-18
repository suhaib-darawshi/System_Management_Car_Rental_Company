import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Widgets/CarWidget.dart';

import '../../providers/provider.dart';


class CarIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
              itemCount: Provider.of<CarProvider>(context).carInPlace.length,
              itemBuilder: (context, index) {
                return CarWidget(Provider.of<CarProvider>(context).carInPlace[index]);
              },
            ),
      ),
    );
     
  }
}
