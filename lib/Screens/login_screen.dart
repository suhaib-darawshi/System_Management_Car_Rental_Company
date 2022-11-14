import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.w,
              alignment: Alignment.center,
              child: Image.asset('assets/images/logo.PNG',),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                
              ),
            )
          ],
        ),
      ),
    );
  }
}