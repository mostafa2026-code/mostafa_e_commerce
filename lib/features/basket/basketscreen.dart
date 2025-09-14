import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mostafa_e_commerce/core/basketdata/basketmodel.dart';
import 'package:mostafa_e_commerce/core/colors.dart';
import 'package:mostafa_e_commerce/core/hiveservice/Hiveservice.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/home/homedata.dart';
import 'package:mostafa_e_commerce/features/welcome/welcomescreen.dart';

class Basketscreen extends StatefulWidget {
  
  const Basketscreen({
    super.key,
    
    
    
  });

  @override
  State<Basketscreen> createState() => _BasketscreenState();
}

class _BasketscreenState extends State<Basketscreen> {
  List<Product> basket = [];

  @override
 
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
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hiveservice.basketbox.listenable(),
              builder: (context, basketboxvalue, child) {
                List<dynamic> basketlist = basketboxvalue.values.toList();
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: basketboxvalue.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(10);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Basketmodel basketProduct = basketlist[index];
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 33,
                            child: Image.asset(
                              basketProduct.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                basketProduct.name,
                                style: Mystyles().b16_500(),
                              ),
                              Text("${basketProduct.pecknumber} Packs"),
                            ],
                          ),
                          Text((basketProduct.total_price).toString()),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(total_price().toString()),
              Mainbuttom(
                onpressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          Text("Delivery address", style: Mystyles().b20_500()),

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
                              Mainbuttom(
                                onpressed: () {},
                                title: "pay with card",
                              ),
                              Mainbuttom(
                                onpressed: () {},
                                title: "pay on delivery",
                              ),
                            ],
                          ),
                        ],
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

// ignore: non_constant_identifier_names
double total_price() {
  double totalTotalprice = 0;
  List basketlistforprice = Hiveservice.basketbox.values.toList();
  for (Basketmodel obj in basketlistforprice) {
    totalTotalprice += obj.total_price;
  }
  return totalTotalprice;
}
