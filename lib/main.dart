import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rental_management_app/UI/Screens/ServiceScreens/CarDetails.dart';
import 'package:rental_management_app/UI/Screens/ServiceScreens/DailyStock.dart';
import 'package:rental_management_app/UI/Screens/ServiceScreens/TransferredCarList.dart';
import 'package:rental_management_app/UI/Screens/login_screen.dart';
import 'package:rental_management_app/UI/Screens/updateCar.dart';
import 'package:rental_management_app/UI/Widgets/CarWidget.dart';
import 'package:rental_management_app/data/dummy.dart';
import 'package:rental_management_app/data/sqlhelper.dart';
import 'package:rental_management_app/models/car.dart';
import 'package:rental_management_app/providers/provider.dart';
import 'UI/Screens/AddCarPage.dart';
import 'UI/Screens/HomePage.dart';
import 'UI/Screens/ServiceScreens/DailyTasks.dart';
import 'UI/Screens/ServiceScreens/DamagedListScreen.dart';
import 'UI/Screens/ServiceScreens/SearchScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SQL.sql.initDatabase();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/languages',
      fallbackLocale: Locale('en'),
      child: ChangeNotifierProvider<CarProvider>(
        create: (context)  {
          return CarProvider();
        },
        child: Material(),
      ),
    );
  }
}

class Material extends StatelessWidget {
  const Material({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 891),
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          routes: {
            'Login':(context) => LoginScreen(),
            'Home':(context) => HomePage(),
            'Add Car':(context) => AddCarPage(),
            'Update':(context) => UpdateCar(),
            'Daily Tasks':(context) => DailyTasks(),
            'DailY Stock':(context) => DailyStock(),
            'Details':(context) => CarDetails(),
            'Damaged':(context) => DamagedScreen(),
            'Transferred':(context) => TransferredScreen(),
            'SearchCar':(context) => SearchCar()
          },
          home: HomePage(),
        );
      },
    );
  }
}

class TestWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CarWidget(Car.fromMap(cardata)),
    );
  }
}
