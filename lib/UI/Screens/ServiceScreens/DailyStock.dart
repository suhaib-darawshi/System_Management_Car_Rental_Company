import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyStock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
              onPressed: () => Navigator.of(context).pop(),
            ),
      ),
    );
  }
}