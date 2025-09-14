import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mostafa_e_commerce/core/colors.dart';
import 'package:mostafa_e_commerce/core/styles.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mycolors().orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Delivery Status ",
          style: Mystyles().w16_500().copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              listtileordertrack(
                image:
                    "assets/images/19-190811_customer-order-orders-icon-clipart-removebg-preview.png",
                icon: Icon(
                  Icons.check_circle,
                  color: const Color.fromARGB(255, 73, 240, 78),
                ),
                title: "Order Taken",
              ),
              dividertracking(),
              listtileordertrack(
                image: "assets/images/68-512-removebg-preview.png",
                title: "Order Is Being Prepared",
                icon: Icon(
                  Icons.check_circle,
                  color: const Color.fromARGB(255, 73, 240, 78),
                ),
              ),
              dividertracking(),
              listtileordertrack(
                image:
                    "assets/images/delivery-man-riding-red-scooter-illustration_9845-14-removebg-preview.png",
                title: "Order Is Being Delivered",
                icon: Icon(Icons.phone_in_talk),
              ),
              dividertracking(),
              ClipRRect(
                child: Image.asset(
                  "assets/images/Rectangle 45.png",
                  
                  width: double.infinity,
                  fit: BoxFit.fitWidth
                ),
              ),
              dividertracking(),
              listtileordertrack(
                image: "assets/images/Group 52.png",
                title: "Order Received",
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class dividertracking extends StatelessWidget {
  const dividertracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(50),
        Container(width: 2, height: 60, color: Mycolors().orange),
      ],
    );
  }
}

// ignore: camel_case_types
class listtileordertrack extends StatelessWidget {
  final String image;
  final String title;
  final Widget icon;
  const listtileordertrack({
    super.key,
    required this.image,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Mycolors().white,
        border: BoxBorder.all(color: Mycolors().orange),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(image),
          ),
          Gap(10),
          Expanded(child: Text(title, style: Mystyles().b16_500())),
          icon,
        ],
      ),
    );
  }
}
