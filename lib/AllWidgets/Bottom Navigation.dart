import 'package:buraq_admin/AllScreens/mainscreen.dart';
import 'package:buraq_admin/DataHandler/constants.dart';
import 'package:flutter/material.dart';


class BottomNavigation extends StatefulWidget {
   BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      unselectedItemColor: Colors.white,
      fixedColor: kCardColor,
      elevation: 50.0,
      currentIndex: selectedIndex, //New
      onTap: _onItemTapped,
      items:const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.call,),
          label: 'Calls',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
      ],

    );
  }
}

