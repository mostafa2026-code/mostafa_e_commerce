import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mostafa_e_commerce/core/basketdata/basketmodel.dart';
import 'package:mostafa_e_commerce/core/colors.dart';
import 'package:mostafa_e_commerce/core/hiveservice/Hiveservice.dart';
import 'package:mostafa_e_commerce/core/styles.dart';
import 'package:mostafa_e_commerce/features/congratulations/congratulation.dart';
import 'package:mostafa_e_commerce/features/home/homedata.dart';
import 'package:mostafa_e_commerce/features/home/homescreen.dart';
import 'package:mostafa_e_commerce/features/welcome/welcomescreen.dart';
import 'package:mostafa_e_commerce/main.dart';

class Basketscreen extends StatefulWidget {
  const Basketscreen({super.key});

  @override
  State<Basketscreen> createState() => _BasketscreenState();
}

class _BasketscreenState extends State<Basketscreen> {
  List<Product> basket = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Homescreen()),
              (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        backgroundColor: Mycolors().orange,
        title: Text(
          "My basket",
          style: Mystyles().w16_500().copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hiveservice.basketbox.listenable(),
                builder: (context, basketboxvalue, child) {
                  List<dynamic> basketlist = basketboxvalue.values
                      .cast<Basketmodel>()
                      .toList();
                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: basketboxvalue.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Gap(10);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Basketmodel basketProduct = basketlist[index];
                      return Card(
                        color: Colors.white,
                        shadowColor: Colors.black12,
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
                            Gap(10),
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
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text((basketProduct.total_price).toString()),
                                ],
                              ),
                            ),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(total_price().toString()),
                Gap(10),
                Expanded(
                  child: Mainbuttom(
                    onpressed: () {
                      bottmsheetbasket(context);
                    },
                    title: "check out",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottmsheetbasket(BuildContext context) {
    DateTime? date;
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    GlobalKey<FormState> key2 = GlobalKey<FormState>();
    return showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Mycolors().white,
      context: context,
      builder: (context) {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,

          child: DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            expand: false,
            builder: (_, scrollController) {
              return Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Color(0xFF6A3B00)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Delivery address', style: Mystyles().b20_500()),

                    const SizedBox(height: 8),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter an address ";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: '10th avenue, Lekki, Lagos State',
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Number we can call', style: Mystyles().b20_500()),
                    const SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter a phone number";
                        } else if (isvalidmobilenumber(value) == false) {
                          return "please enter a valid mobile number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: '09090605708'),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: MainbuttomEmpty(
                            onpressed: () {},
                            title: "Pay on delivery",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Mainbuttom(
                            onpressed: () async {
                              if (formkey.currentState!.validate()) {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  showDragHandle: true,
                                  isDismissible: true,
                                  enableDrag: true,
                                  context: context,
                                  builder: (context) {
                                    return Form(
                                      key: key2,
                                      child: DraggableScrollableSheet(
                                        initialChildSize: .5,
                                        maxChildSize: 1,
                                        minChildSize: .3,
                                      
                                        expand: false,
                                        builder: (context, scrollController) {
                                          return Container(
                                            padding: EdgeInsets.all(24),
                                            child: ListView(
                                              controller: scrollController,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: IconButton(
                                                        icon: const Icon(
                                                          Icons.close,
                                                          color: Color(
                                                            0xFF6A3B00,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(
                                                            context,
                                                          ).pop();
                                                        },
                                                      ),
                                                    ),
                                                    Text(
                                                      "Card Holders Name",
                                                      style: Mystyles().b20_500(),
                                                    ),
                                                    Gap(10),
                                                    TextFormField(
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return "please enter a Card Holders Name";
                                                        } else if (isValidCardHolderName(
                                                              value,
                                                            ) ==
                                                            false) {
                                                          return "please enter a  valid Card Holders Name";
                                                        }
                                                        return null;
                                                      },
                                                      decoration: InputDecoration(
                                                        hintText:
                                                            "Adolphus Chris",
                                                      ),
                                                    ),
                                                    Gap(10),
                                                    Text(
                                                      "Card Number",
                                                      style: Mystyles().b20_500(),
                                                    ),
                                                    Gap(10),
                                                    TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return "Please enter a card number";
                                                        } else if (!isValidCardNumber(
                                                          value,
                                                        )) {
                                                          return "Card number must be in format 1234 5678 9012 3456";
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      decoration: InputDecoration(
                                                        hintText:
                                                            "1234 5678 9012 1314",
                                                      ),
                                                    ),
                                                    Gap(10),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Text("Date"),
                                                              TextFormField(
                                                                readOnly: true,
                                                                onTap: () async {
                                                                  date = await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    firstDate:
                                                                        DateTime.now(),
                                                                    lastDate:
                                                                        DateTime(
                                                                          2050,
                                                                        ),
                                                                  );
                                                                },
                                                                decoration: InputDecoration(
                                                                  hintText:
                                                                      DateFormat(
                                                                            "MM-dd",
                                                                          )
                                                                          .format(
                                                                            date ??
                                                                                DateTime.now(),
                                                                          )
                                                                          .toString(),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Gap(10),
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Text("CCV"),
                                                              TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .onUserInteraction,
                                                                validator: (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return "please enter a CCV ";
                                                                  } else if (isValidCCV(
                                                                        value,
                                                                      ) ==
                                                                      false) {
                                                                    return "please enter a valid CCv";
                                                                  }
                                                                  return null;
                                                                },
                                                                readOnly: false,
                                                                decoration:
                                                                    InputDecoration(
                                                                      hintText:
                                                                          "123",
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Gap(10),
                                                    Mainbuttom(
                                                      onpressed: () async {
                                                        if (key2.currentState!
                                                            .validate()) {
                                                          await Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Congratulation(),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      title: "Complete Order",
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            title: "Pay with card",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
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
}

// Future<dynamic> cardbottomsheet(BuildContext context) {

//   GlobalKey<FormState> key2 = GlobalKey<FormState>();
//   return;
// }

// class CardBottomSheet extends StatefulWidget {
//   const CardBottomSheet({super.key});

//   @override
//   State<CardBottomSheet> createState() => _CardBottomSheetState();
// }

// class _CardBottomSheetState extends State<CardBottomSheet> {
//   DateTime? date;
//   final GlobalKey<FormState> key2 = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Form(
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         key: key2,
//         child: DraggableScrollableSheet(
//           initialChildSize: .5,
//           maxChildSize: 1,
//           minChildSize: .3,
//           expand: false,
//           builder: (context, scrollController) {
//             return Container(
//               padding: EdgeInsets.all(24),
//               child: ListView(
//                 controller: scrollController,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: IconButton(
//                           icon: const Icon(
//                             Icons.close,
//                             color: Color(0xFF6A3B00),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ),
//                       Text("Card Holders Name", style: Mystyles().b20_500()),
//                       Gap(10),
//                       TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "please enter a Card Holders Name";
//                           } else if (isValidCardHolderName(value) == false) {
//                             return "please enter a  valid Card Holders Name";
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(hintText: "Adolphus Chris"),
//                       ),
//                       Gap(10),
//                       Text("Card Number", style: Mystyles().b20_500()),
//                       Gap(10),
//                       TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "please enter a Card number";
//                           } else if (isValidCardNumber(value) == false) {
//                             return "please enter a  valid Card number";
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           hintText: "1234 5678 9012 1314",
//                         ),
//                       ),
//                       Gap(10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 Text("Date"),
//                                 TextFormField(
//                                   readOnly: true,
//                                   onTap: () async {
//                                     DateTime? picked = await showDatePicker(
//                                       context: context,
//                                       initialDate: date ?? DateTime.now(),
//                                       firstDate: DateTime.now(),
//                                       lastDate: DateTime(2050),
//                                     );
//                                     if (picked != null) {
//                                       setState(() {
//                                         date = picked;
//                                       });
//                                     }
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: date != null
//                                         ? DateFormat("MM-dd").format(date!)
//                                         : "MM-DD",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Gap(10),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 Text("CCV"),
//                                 TextFormField(
//                                   autovalidateMode:
//                                       AutovalidateMode.onUserInteraction,
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return "please enter a CCV ";
//                                     } else if (!RegExp(
//                                       r'^[0-9]{3,4}$',
//                                     ).hasMatch(value)) {
//                                       return "please enter a valid CCV";
//                                     }
//                                     return null;
//                                   },
//                                   readOnly: false,
//                                   decoration: InputDecoration(hintText: "123"),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       Gap(10),
//                       Mainbuttom(
//                         onpressed: () async {
//                           if (key2.currentState!.validate()) {
//                             await Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Congratulation(),
//                               ),
//                             );
//                           }
//                         },
//                         title: "Complete Order",
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
