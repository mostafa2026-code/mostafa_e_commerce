import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/home/homedata.dart';
import 'package:svg_flutter/svg.dart';
import 'package:intl/intl.dart';
import 'package:mostafa_e_commerce/core/colors.dart';

final formatCurrency = NumberFormat.currency(
  locale: "en_NG", // NG = نيجيريا
  symbol: "₦",
);

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // ignore: non_constant_identifier_names
  bool favourite_filled = false;

  List<String> category = ["Hottest", "Popular", "New combos", "Top"];

  // ignore: non_constant_identifier_names
  int cateegory_selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          Column(
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  "assets/images/Vector.svg",
                  height: 24,
                  width: 24,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "My basket",
                style: Mystyles().b20_400().copyWith(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Text("Hello name ,", style: Mystyles().b20_400()),
                Text("What fruit salad", style: Mystyles().b20_500()),
              ],
            ),
            Text("combo do you want today?", style: Mystyles().b20_500()),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefix: Icon(Icons.search),
                      hintText: "Search for fruit salad combos",
                    ),
                  ),
                ),
                Gap(16),
                SvgPicture.asset(
                  "assets/images/Group.svg",
                  height: 17,
                  width: 26,
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Gap(23);
                },
                itemBuilder: (BuildContext context, int index) {
                  Product p1 = products[index];
                  return Container(
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(p1.imageUrl),
                              Text(p1.name, style: Mystyles().b16_500()),
                              Row(
                                children: [
                                  Text(
                                    formatCurrency.format(p1.price),
                                    style: Mystyles().g16_400().copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Gap(38),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      color: Mycolors().orange,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                favourite_filled = !favourite_filled;
                              });
                            },
                            icon: favourite_filled
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border_outlined),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Gap(48),
            Row(
              children: List.generate(products.length, (int index) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      cateegory_selected = index;
                    });
                  },
                  child: Text(
                    category[index],
                    style: cateegory_selected == index
                        ? Mystyles().b24_500().copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Mycolors().orange,
                          )
                        : Mystyles().g16_500(),
                  ),
                );
              }),
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Gap(23);
                },
                itemBuilder: (BuildContext context, int index) {
                  Product p2 = products[index];
                  return Container(
                    height: 150,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors[index],
                    ),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_outlined),
                          ),
                          Center(
                            child: Image.asset(
                              p2.imageUrl,
                              height: 64,
                              width: 64,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(p2.imageUrl, style: Mystyles().b16_500()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                p2.price.toString(),
                                style: Mystyles().o14_400(),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add, color: Mycolors().orange),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
