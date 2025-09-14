import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:mostafa_e_commerce/core/colors.dart';
import 'package:mostafa_e_commerce/core/hiveservice/Hiveservice.dart';
import 'package:mostafa_e_commerce/features/home/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hiveservice.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
      theme: ThemeData(
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
