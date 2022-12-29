import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../AllScreens/admin.dart';
import '../DataHandler/Controllers/captains_controller.dart';
import '../DataHandler/constants.dart';
import '../DataHandler/Models/CaptainModel.dart';
import 'cardWidget.dart';


class Page2 extends StatelessWidget {
  const Page2({
    Key? key,
    required ScrollController controller,
    required this.totalApprovedDrivers,
    required this.totalPendingDrivers,
    required this.totalUnApprovedDrivers,
    required this.users,
  }) : _controller = controller, super(key: key);

  final ScrollController _controller;
  final RxInt totalApprovedDrivers;
  final RxInt totalPendingDrivers;
  final RxInt totalUnApprovedDrivers;
  final users;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _controller,
      children: [
        Container(
          height: 25.0,
          width: double.infinity,
        ),
        Container(
          height: 215,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              CardWidget(
                drivers: totalApprovedDrivers,
                onTap: () {
                  Get.to(() => AdminScreen(
                    type: "Verified",
                  ));
                },
                text: "Total Captains",
              ),
              CardWidget(
                drivers: totalPendingDrivers,
                onTap: () {
                  Get.to(() => AdminScreen(
                    type: "pending",
                  ));
                },
                text: "Pending Drivers",
              ),
              CardWidget(
                drivers: totalUnApprovedDrivers,
                onTap: () {
                  Get.to(() => AdminScreen(
                    type: "new",
                  ));
                },
                text: "New Driver Requests",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Users in Last Week",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Brand-Regular"),
                ),
                Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(20.0),
                    color: kCardColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Center(
          child: Text(
            "Latest Order for Balance",
            style: TextStyle(
                fontFamily: "Brand-Regular", fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: List.generate(
                captainController.allCapatins!.length, (index) {
              return Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                            'images/user_icon.png'),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${captainController.allCapatins![index].name}",
                            style: const TextStyle(
                                fontFamily: "Brand-Bold",
                                fontSize: 20.0),
                          ),
                          Text(
                            "${captainController.allCapatins![index].email}",
                            style: const TextStyle(
                                fontFamily: "Brand-Regular",
                                fontSize: 10.0),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(

                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.deleteLeft),),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.cancel,color: Colors.red,)),
                    ],
                  )
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
