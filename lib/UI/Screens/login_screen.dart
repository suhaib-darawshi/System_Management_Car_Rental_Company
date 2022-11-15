import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/providers/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CarProvider>(
        builder: (context, provider, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 300.w,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo.PNG',
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person_rounded,
                            color: Colors.black,
                          ),
                          labelText: "Email".tr(),
                        ),
                        controller: provider.emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock_open,
                            color: Colors.black,
                          ),
                          labelText: "Password".tr(),
                        ),
                        controller: provider.passwordController,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          bool t = provider.logIn();
                        },
                        child: Text("Sign in".tr()))
                  ],
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
