
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mostafa_e_commerce/core/colors.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/home/homedata.dart';
import 'package:mostafa_e_commerce/features/welcome/welcomescreen.dart';

class Basketscreen extends StatefulWidget {
  final Product productdetails2;
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  final number_of_products;
  const Basketscreen({
    super.key,
    required this.productdetails2,
    // ignore: non_constant_identifier_names
      this.number_of_products,
  });

  @override
  State<Basketscreen> createState() => _BasketscreenState();
}

class _BasketscreenState extends State<Basketscreen> {
  List<Product> basket = [];

  @override
  void initState() {
    super.initState();
    basket.add(widget.productdetails2);
    // basket.map((e){
    //   e.price;
    // }).reduce(combine)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mycolors().orange,
        title: Text(
          "My basket",
          style: Mystyles().w16_500().copyWith(fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.separated(
            itemCount: basket.length,
            separatorBuilder: (BuildContext context, int index) {
              return Gap(10);
            },
            itemBuilder: (BuildContext context, int index) {
              Product probasket = basket[index];
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 33,
                      child: Image.asset(probasket.imageUrl, fit: BoxFit.cover),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(probasket.name, style: Mystyles().b16_500()),
                        Text("${widget.number_of_products} Packs"),
                      ],
                    ),
                    Text(
                      (widget.productdetails2.price * widget.number_of_products)
                          .toString(),
                    ),
                  ],
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("total price "),
              Mainbuttom(
                onpressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: Column(
                          children: [
                            Text(
                              "Delivery address",
                              style: Mystyles().b20_500(),
                            ),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "10th avenue, Lekki, Lagos State",
                              ),
                            ),
                            Text(
                              "Number we can call",
                              style: Mystyles().b20_500(),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "09090605708",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Mainbuttom(onpressed: (){}, title: "pay with card"),
                                Mainbuttom(onpressed: (){}, title: "pay on delivery")
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                title: "check out",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
