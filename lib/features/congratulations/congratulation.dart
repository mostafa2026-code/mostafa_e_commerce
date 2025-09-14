import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/home/homescreen.dart';
import 'package:mostafa_e_commerce/features/locationtracker/locationtracker.dart';
import 'package:mostafa_e_commerce/features/welcome/welcomescreen.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/icons/Success.json"),
            Text(
              "Congratulations!!!",
              style: Mystyles().b24_500().copyWith(fontSize: 32),
            ),
            Text(
              "Your order have been taken and \n is being attended to",
              textAlign: TextAlign.center,
              style: Mystyles().g16_400().copyWith(fontSize: 20),
            ),
            Mainbuttom(
              onpressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OrderTrackingScreen()),
                );
              },
              title: "Track order",
            ),
            MainbuttomEmpty(
              onpressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Homescreen()),
                  (route) => false,
                );
              },
              title: "Continue shopping",
            ),
          ],
        ),
      ),
    );
  }
}
