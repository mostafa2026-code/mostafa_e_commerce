import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/basket/basketscreen.dart';
import 'package:mostafa_e_commerce/features/details/detailsscreen.dart';
import 'package:mostafa_e_commerce/features/home/homedata.dart';
import 'package:mostafa_e_commerce/features/locationtracker/locationtracker.dart';
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
  List<String> category = ["Hottest", "Popular", "New combos", "Top"];

  // ignore: non_constant_identifier_names
  int cateegory_selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,

        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            );
          },
        ),
        actions: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Basketscreen()),
                  );
                },
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
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Hello name ,", style: Mystyles().b20_400()),
                  Text("What fruit salad", style: Mystyles().b20_500()),
                ],
              ),
              Text("combo do you want today?", style: Mystyles().b20_500()),
              Gap(24),
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
              Gap(40),
              Text("Recommended Combo", style: Mystyles().b24_500()),
              Gap(24),
              SizedBox(height: 250, child: Listview()),
              Gap(48),
              Row(
                children: List.generate(category.length, (int index) {
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
              SizedBox(height: 250, child: Listview()),
            ],
          ),
        ),
      ),
      drawer: Drawer(

        backgroundColor: Mycolors().white,
        child: Column(
          
          children: [
            Gap(100),
            listtileindrawer(
              title: "My basket",
              icon: Icons.shopping_bag_outlined,
              to: Basketscreen(),
            ),
            listtileindrawer(
              title: "track your order",
              icon: Icons.spatial_tracking_outlined,
              to: OrderTrackingScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class listtileindrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget to;
  const listtileindrawer({
    super.key,
    required this.title,
    required this.icon,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Center(child: Text(title)),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => to));
      },
    );
  }
}

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      separatorBuilder: (BuildContext context, int index) {
        return Gap(23);
      },
      itemBuilder: (BuildContext context, int index) {
        Product p1 = products[index];
        return Listviewcontainer(p1: p1);
      },
    );
  }
}

class Listviewcontainer extends StatefulWidget {
  final Product p1;

  const Listviewcontainer({super.key, required this.p1});

  @override
  State<Listviewcontainer> createState() => _ListviewcontainerState();
}

class _ListviewcontainerState extends State<Listviewcontainer> {
  // ignore: non_constant_identifier_names
  bool favourite_filled = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Detailsscreen(productdetails: widget.p1);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Mycolors().white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(widget.p1.imageUrl),
                  Text(widget.p1.name, style: Mystyles().b16_500()),
                  Row(
                    children: [
                      Text(
                        formatCurrency.format(widget.p1.price),
                        style: Mystyles().g16_400().copyWith(fontSize: 14),
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
                    ? Icon(Icons.favorite, color: Colors.red)
                    : Icon(Icons.favorite_border_outlined, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
