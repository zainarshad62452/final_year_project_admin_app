import 'dart:ffi';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:buraq_admin/AllScreens/admin.dart';
import 'package:buraq_admin/DataHandler/Controllers/captains_controller.dart';
import 'package:buraq_admin/DataHandler/constants.dart';
import 'package:buraq_admin/DataHandler/Models/CaptainModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../AllWidgets/cardWidget.dart';
import '../AllWidgets/page2.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "main";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController searchtextEditingController = TextEditingController();

  var totalUnApprovedDrivers = 0.obs;

  var totalApprovedDrivers = 0.obs;

  var totalDrivers = 0.obs;

  var totalPendingDrivers = 0.obs;

  late var users;

  final width = 280.0;

  // var isScroll = false.obs;
  int _selectedIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> UserList = [];

  void updateDetails() {
    totalUnApprovedDrivers = 0.obs;
    totalApprovedDrivers = 0.obs;
    totalDrivers = 0.obs;
    totalPendingDrivers = 0.obs;

    for (var user in users) {
      if (user.type == 'captain') {
        totalApprovedDrivers++;
      }

      if (user.type == 'isPending') {
        totalPendingDrivers++;
      }

      if (user.type == 'new') {
        totalUnApprovedDrivers++;
      }

      totalDrivers++;
    }
  }

  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
  @override
  Widget build(BuildContext context) {
    Stream<List<CaptainModel>> readUsers() => FirebaseFirestore.instance
        .collection('captain')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => CaptainModel.fromJson(doc.data())).toList());
    return Scaffold(
      backgroundColor: Color(0xFFf8f7f1),
      body: StreamBuilder<List<CaptainModel>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.data);
              return Text(
                  "Something is went wromg" + snapshot.error.toString());
            } else if (snapshot.hasData) {
              users = snapshot.data!;
              updateDetails();
              return SafeArea(
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => _selectedIndex = index);
                      },
                      children: <Widget>[
                        ListView(
                          children: [
                            Container(
                              height: 25.0,
                              width: double.infinity,
                            ),
                            Container(
                              height: 215,
                              child: Text("Page 1",),
                            ),
                          ],
                        ),
                        Page2(controller: _controller, totalApprovedDrivers: totalApprovedDrivers, totalPendingDrivers: totalPendingDrivers, totalUnApprovedDrivers: totalUnApprovedDrivers,users: users,),
                        ListView(
                          children: [
                            Container(
                              height: 25.0,
                              width: double.infinity,
                            ),
                            Container(
                              height: 215,
                              child: Text("Page 3"),
                            ),
                          ],
                        ),
                        ListView(
                          children: [
                            Container(
                              height: 25.0,
                              width: double.infinity,
                            ),
                            Container(
                              height: 215,
                              child: Text("Page 4"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Visibility(
                      child: Positioned(
                        bottom: 200.0,
                        right: 10.0,
                        child: FloatingActionButton.small(
                          onPressed: () {
                            _scrollDown();
                          },
                          backgroundColor: Color(0xFFf6d78b),
                          child: const Icon(
                            Icons.arrow_upward,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 10.0,
                      height: 80,
                      width: 400,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kMatteColor,
                          borderRadius: BorderRadius.circular(200.0),
                          border: Border.all(color: Colors.white, width: 4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BottomNavyBar(
                            backgroundColor: Colors.transparent,
                            selectedIndex: _selectedIndex,
                            showElevation:
                                true, // use this to remove appBar's elevation
                            onItemSelected: (index) => setState(() {
                              _selectedIndex = index;
                              _pageController.animateToPage(index,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            }),
                            items: [
                              BottomNavyBarItem(
                                icon: Icon(Icons.apps),
                                title: Text(
                                  'Home',
                                  style: TextStyle(fontFamily: "Brand-Bold"),
                                ),
                                activeColor: kCardColor,
                                inactiveColor: Color(0xFFf8f7f1),
                              ),
                              BottomNavyBarItem(
                                icon: Icon(Icons.people),
                                title: Text(
                                  'Users',
                                  style: TextStyle(fontFamily: "Brand-Bold"),
                                ),
                                activeColor: kCardColor,
                                inactiveColor: Color(0xFFf8f7f1),
                              ),
                              BottomNavyBarItem(
                                icon: Icon(Icons.message),
                                title: Text(
                                  'Messages',
                                  style: TextStyle(fontFamily: "Brand-Bold"),
                                ),
                                activeColor: kCardColor,
                                inactiveColor: Color(0xFFf8f7f1),
                              ),
                              BottomNavyBarItem(
                                icon: Icon(Icons.settings),
                                title: Text(
                                  'Settings',
                                  style: TextStyle(fontFamily: "Brand-Bold"),
                                ),
                                activeColor: kCardColor,
                                inactiveColor: Color(0xFFf8f7f1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }
}

