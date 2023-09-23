import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/models/Profile.dart';
import 'package:my_vofo/view/widgets/longs.dart';
import 'package:my_vofo/view/widgets/my_vos.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';
import 'package:my_vofo/view/widgets/simple_tab_bar.dart';

import '../../../calls/profile/GetProfile.dart';

class Profile extends StatefulWidget {
  final bool isMe;
  final String username;
  const Profile({required this.isMe, required this.username, Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  final bool isMe = false;
  ProfileModel? profile;

  _fetchProfile () async {
    var prof = jsonDecode(await getProfile(widget.username));
    if(prof['status']){
      var pf = prof['profile'];
      ProfileModel pfObj = ProfileModel.fromJson(pf);
      setState(() {
        profile = pfObj;
      });
    }


  }
  @override
  void initState() {
    _fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromRGBO(59, 59, 59, 1)),
          backgroundColor: Colors.white,
          titleSpacing: 5,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            'Chloe_jr',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Color.fromRGBO(59, 59, 59, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 235,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Color.fromRGBO(172, 169, 187, 1),
                            child: CircleAvatar(
                              radius: 32.5,
                              backgroundImage: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '31',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(59, 59, 59, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Post',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(89, 101, 111, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                '225',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(59, 59, 59, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Followers',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(89, 101, 111, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                '243',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(59, 59, 59, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Following',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(89, 101, 111, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Text(
                        'Chloe Jr',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'This is where I write my description, other info, etc. I can also share my company or personal URL like this-',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(89, 101, 111, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'www.chloeadam.com',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(0, 159, 183, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    (isMe == true)
                        ? Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                height: 38,
                                child: SimpleButton(
                                  backgroundColor:
                                      Color.fromRGBO(219, 219, 219, 1),
                                  text: 'Edit Profile',
                                  textColor: Color.fromRGBO(59, 59, 59, 1),
                                  onPressed: () {},
                                  borderColor: Color.fromRGBO(219, 219, 219, 1),
                                  isProfile: true,
                                )),
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      height: 38,
                                      child: SimpleButton(
                                        backgroundColor:
                                            Color.fromRGBO(219, 219, 219, 1),
                                        text: 'Following',
                                        textColor:
                                            Color.fromRGBO(59, 59, 59, 1),
                                        onPressed: () {},
                                        borderColor:
                                            Color.fromRGBO(219, 219, 219, 1),
                                        isProfile: true,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      height: 38,
                                      child: SimpleButton(
                                        backgroundColor:
                                            Color.fromRGBO(219, 219, 219, 1),
                                        text: 'Message',
                                        textColor:
                                            Color.fromRGBO(59, 59, 59, 1),
                                        onPressed: () {},
                                        borderColor:
                                            Color.fromRGBO(219, 219, 219, 1),
                                        isProfile: true,
                                      )),
                                ),
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: SimpleTabBar(
                  tabLength: 2,
                  tab: <Widget>[
                    Tab(
                      text: 'MyVos',
                    ),
                    Tab(
                      text: 'Longs',
                    )
                  ],
                  children: <Widget>[
                    SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            if (index == 1) {
                              // return MyVos(
                              //   isThread: true,
                              // );
                            }
                            // return MyVos(voice: null,);
                          })),
                    ),
                    SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            if (index == 1) {
                              return Longs(
                                isPromoted: true,
                              );
                            }
                            return Longs();
                          })),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
