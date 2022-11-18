import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../providers/provider.dart';
import 'ViewCarWidget.dart';

class TransferredCarsList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
              itemCount: Provider.of<CarProvider>(context).carInPlace.length,
              itemBuilder: (context, index) {
                return CarWidgetForUpdate(Provider.of<CarProvider>(context).carInPlace[index]);
              },
            ),
      ),
    );
  }
}