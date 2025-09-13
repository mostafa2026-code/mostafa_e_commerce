import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mostafa_e_commerce/core/colors.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/home/homescreen.dart';

class Welcomscreen extends StatelessWidget {
  const Welcomscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 470,
                width: double.infinity,
                decoration: BoxDecoration(color: Mycolors().orange),
              ),
              Positioned(
                height: 155,
                bottom: 55,
                right: 40,
                left: 35,
                child: Image.asset(
                  "assets/images/basket-of-fruit.png",
                  height: 260,
                  width: 301,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(56),
                Text(
                  "Get The Freshest Fruit Salad Combo",
                  style: Mystyles().b20_500(),
                ),
                Gap(8),
                Text(
                  "We deliver the best and freshest fruit salad in town. Order for a combo today!!!",
                  style: Mystyles().g16_400(),
                ),
                Gap(56),
                Mainbuttom(
                  title: "Let’s Continue",
                  onpressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Homescreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Mainbuttom extends StatelessWidget {
  final Function() onpressed;
  final String title;

  const Mainbuttom({super.key, required this.onpressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, double.infinity),
          backgroundColor: Mycolors().orange,
        ),
        child: Text(title, style: Mystyles().w16_500()),
      ),
    );
  }
}




class MainbuttomEmpty extends StatelessWidget {
  final Function() onpressed;
  final String title;

  const MainbuttomEmpty({super.key, required this.onpressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: BoxBorder.all(color: Mycolors().orange)),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, double.infinity),
        ),
        child: Text(title, style: Mystyles().o14_400().copyWith(fontSize: 24 , fontWeight: FontWeight.w500)),
      ),
    );
  }
}

