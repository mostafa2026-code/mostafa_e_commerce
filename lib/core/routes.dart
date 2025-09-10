import 'package:flutter/material.dart';
import 'package:mostafa_e_commerce/features/home/homescreen.dart';

class MyRoutes {
  MaterialPageRoute to_home(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return Homescreen();
      },
    );
  }

  MaterialPageRoute to_basket(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return Homescreen();
      },
    );
  }
}
