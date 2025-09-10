import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mostafa_e_commerce/core/colors.dart';
import 'package:mostafa_e_commerce/core/routes.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/home/homedata.dart';
import 'package:mostafa_e_commerce/features/welcome/welcomescreen.dart';

class Detailsscreen extends StatefulWidget {
  final Product productdetails;
  const Detailsscreen({super.key, required this.productdetails});

  @override
  State<Detailsscreen> createState() => _DetailsscreenState();
}

class _DetailsscreenState extends State<Detailsscreen> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors().orange,
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Center(
              child: Image.asset(
                widget.productdetails.imageUrl,
                height: 170,
                width: 170,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productdetails.name,
                    style: Mystyles().b24_500().copyWith(fontSize: 32),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                number--;
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ),
                      ),
                      Text(number.toString()),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Mycolors().orange,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                number++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ),
                      Text(
                        widget.productdetails.price.toString(),
                        style: Mystyles().b24_500(),
                      ),
                    ],
                  ),
                  Divider(),
                  Gap(32),
                  Text(
                    "one pack contain",
                    style: Mystyles().b20_500().copyWith(),
                  ),
                  Text(widget.productdetails.contents.toString()),
                  Divider(),
                  Text(
                    "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make",
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Mycolors().lightorange,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                        ),
                      ),
                      Gap(20),
                      Expanded(
                        child: Mainbuttom(
                          onpressed: () {
                            Navigator.push(
                              context,
                              MyRoutes().to_basket(context),
                            );
                          },
                          title: "Go to basket",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
