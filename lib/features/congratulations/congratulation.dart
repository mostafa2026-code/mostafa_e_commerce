import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/welcome/welcomescreen.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            style: Mystyles().g16_400().copyWith(fontSize: 20),
          ),
          Mainbuttom(onpressed: () {}, title: "Track order"),
          MainbuttomEmpty(onpressed: () {}, title: "Continue shopping"),
        ],
      ),
    );
  }
}
