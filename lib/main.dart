import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:mostafa_e_commerce/core/basketdata/basketmodel.dart';
import 'package:mostafa_e_commerce/core/colors.dart';
import 'package:mostafa_e_commerce/core/hiveservice/Hiveservice.dart';
import 'package:mostafa_e_commerce/features/splash/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BasketmodelAdapter());
  await Hiveservice.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashscreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(centerTitle: true),
        scaffoldBackgroundColor: Mycolors().white,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color(0xffF3F4F9),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Mycolors().grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Mycolors().orange),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

bool isvalidmobilenumber(value) {
  return RegExp(r'^\+?[0-9]{10,14}$').hasMatch(value);
}


bool isValidCardHolderName(String value) {
  return RegExp(r'^[A-Za-z ]{2,50}$').hasMatch(value);
}


bool isValidCardNumber(String value) => RegExp(r'^\d{4} \d{4} \d{4} \d{4}$').hasMatch(value);

bool isValidCCV(String value) {
  return RegExp(r'^\d{3}$').hasMatch(value);
}

bool isValidCardDate(String value) {
  return RegExp(r'^(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$').hasMatch(value);
}