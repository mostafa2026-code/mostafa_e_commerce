import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mostafa_e_commerce/core/basketdata/basketmodel.dart';
import 'package:mostafa_e_commerce/core/colors.dart';
import 'package:mostafa_e_commerce/core/hiveservice/Hiveservice.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/basket/basketscreen.dart';
import 'package:mostafa_e_commerce/features/home/homedata.dart';
import 'package:mostafa_e_commerce/features/home/homescreen.dart';
import 'package:mostafa_e_commerce/features/welcome/welcomescreen.dart';

class Detailsscreen extends StatefulWidget {
  final Product productdetails;
  const Detailsscreen({super.key, required this.productdetails});

  @override
  State<Detailsscreen> createState() => _DetailsscreenState();
}

class _DetailsscreenState extends State<Detailsscreen> {
  // ignore: non_constant_identifier_names
  bool favourite_details = false;
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors().orange,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                  ),
                  Center(
                    child: Positioned(
                      bottom: 32,
                      child: Image.asset(
                        widget.productdetails.imageUrl,
                        fit: BoxFit.contain,
                        width: 175,
                        height: 175,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 24,
                    child: goback(to: Homescreen()),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Mycolors().white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
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
                      spacing: 24,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (number > 0) {
                                    number--;
                                  }
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
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${widget.productdetails.price * number}",
                                style: Mystyles().b24_500(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Gap(24),
                    Text(
                      "one pack contain",
                      style: Mystyles().b20_500().copyWith(),
                    ),
                    Text(widget.productdetails.contents.toString()),
                    Gap(24),
                    Divider(),
                    Gap(24),
                    Text(
                      "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make",
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Mycolors().lightorange,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                favourite_details = !favourite_details;
                              });
                            },
                            icon: Icon(
                              favourite_details
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Mainbuttom(
                            onpressed: () async {
                              
                              if (number > 0) {
                                double totalPrice =
                                  number.toDouble() *
                                  widget.productdetails.price;
                              String id = DateTime.now().millisecondsSinceEpoch
                                  .toString();
                              await Hiveservice.addtobasket(
                                id,
                                Basketmodel(
                                  name: widget.productdetails.name,
                                  id: id,
                                  image: widget.productdetails.imageUrl,
                                  pecknumber: number,
                                  total_price: totalPrice,
                                  loved: favourite_details
                                ),
                              );
                                Navigator.push(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Basketscreen();
                                    },
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(child: Text("you can't order zero pack")),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.symmetric(horizontal: 24 , vertical: 400),
                                  ),
                                );
                              }
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
      ),
    );
  }
}

// ignore: camel_case_types
class goback extends StatelessWidget {
  final Widget to;
  const goback({super.key, required this.to});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => to),
          (route) => false,
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Mycolors().white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios),
            Text(
              "Go Back",
              style: Mystyles().b16_500().copyWith(color: Mycolors().black),
            ),
          ],
        ),
      ),
    );
  }
}
