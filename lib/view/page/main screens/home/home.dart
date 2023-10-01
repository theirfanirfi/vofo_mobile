import 'package:flutter/material.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/main%20screens/home/home_all.dart';
import 'package:my_vofo/view/page/main%20screens/home/home_longs.dart';
import 'package:my_vofo/view/page/main%20screens/home/home_myvos.dart';
import 'package:my_vofo/view/page/profile%20screens/profile.dart';
import 'package:my_vofo/view/widgets/simple_tab_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(ImageData.Logo),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(isMe: true, username: "self")));
              }),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
                ),
              ),
            )
          ],
        ),
        body: SimpleTabBar(
          tabLength: 3,
          tab: <Widget>[
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'MyVos',
            ),
            Tab(
              text: 'Longs',
            )
          ],
          children: <Widget>[HomeAll(), HomeMyVos(), HomeLongs()],
        ),
      ),
    );
  }
}
