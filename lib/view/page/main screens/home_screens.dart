import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/const/my_vo_fo_icons.dart';
import 'package:my_vofo/storage/VofoStorage.dart';
import 'package:my_vofo/view/page/main%20screens/home/home.dart';
import 'package:my_vofo/view/page/main%20screens/home/home_longs.dart';
import 'package:my_vofo/view/page/main%20screens/message/message.dart';
import 'package:my_vofo/view/page/main%20screens/notification/notification.dart';
// import 'package:my_vofo/view/page/main%20screens/search/search.dart';
import 'package:my_vofo/view/widgets/simple_tab_bar.dart';

import 'add/add.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int pageIdx = 0;
  List pages = [Home(), SearchBar(), Container(), Message(), Notifications()];
  @override
  Widget build(BuildContext context) {
    print('VofoStorage().getUserFromStorage()');
    print(VofoStorage().getUserFromStorage());
    return SafeArea(
      child: Scaffold(
        body: pages[pageIdx],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 2) {
              showBrandsBottomSheet(context);
            } else {
              setState(() {
                pageIdx = value;
              });
            }
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Color.fromRGBO(89, 101, 111, 1),
          selectedItemColor: Color.fromRGBO(0, 159, 183, 1),
          selectedLabelStyle:
              GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 10.0),
          unselectedLabelStyle:
              GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 10.0),
          currentIndex: pageIdx,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  MyVoFo.Home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  MyVoFo.Search,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 159, 183, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    MyVoFo.Add,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Icon(
                      MyVoFo.Message,
                    ),
                    Positioned(
                      top: 1,
                      right: 0,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Color.fromRGBO(167, 29, 49, 1),
                        child: Text(
                          '4',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 8.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                label: 'Message'),
            BottomNavigationBarItem(
                icon: Icon(
                  MyVoFo.Notification,
                ),
                label: 'Notification'),
          ],
        ),
      ),
    );
  }
}
