import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/calls/Like/LikeVoiceRecordAPI.dart';
import 'package:my_vofo/const/my_vo_fo_icons.dart';
import 'package:my_vofo/utils/VofoDateTime.dart';
import 'package:my_vofo/view/page/myvo%20details/short_vofo.dart';
import 'package:my_vofo/view/page/share%20screens/share_screen.dart';

import '../../models/Voice.dart';
import 'audio_wave.dart';

class MyVos extends StatefulWidget {
  final isThread;
  final Voice voice;
  const MyVos({required this.voice, this.isThread, super.key});

  @override
  State<MyVos> createState() => _MyVosState();
}

class _MyVosState extends State<MyVos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.isThread == true) ? 190 : 180,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
                  ),
                ),
              ),
              (widget.isThread == true)
                  ? Flexible(
                      flex: 2,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Color.fromRGBO(241, 241, 241, 1),
                      ),
                    )
                  : Text(''),
              (widget.isThread == true)
                  ? Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
                        ),
                      ),
                    )
                  : Text(''),
            ],
          ),
          Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShortVoFo()));
                  }),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                widget.voice.user.name,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(89, 101, 111, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      widget.voice.user.name,
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            color:
                                                Color.fromRGBO(59, 59, 59, 1),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17.0),
                                      ),
                                      maxLines: 1,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: AutoSizeText(
                                      widget.voice.user.username,
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            color:
                                                Color.fromRGBO(89, 101, 111, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17.0),
                                      ),
                                      maxLines: 1,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                     VofoDateTime.timeAgo(widget.voice.created_at.toString()),
                                      // ' Just Now',
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            color:
                                                Color.fromRGBO(89, 101, 111, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.0),
                                      ),
                                      maxLines: 1,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                      Flexible(
                        child: PopupMenuButton(
                          itemBuilder: (context) => [],
                        ),
                      )
                    ],
                  ),
                ),
                Container(alignment: Alignment.centerLeft, child: AudioWave(true, path: widget.voice.voice_record)),
                AutoSizeText(
                  widget.voice.hash_tags,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color.fromRGBO(0, 159, 183, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Icon(
                      MyVoFo.Listen,
                      size: 18,
                    )),
                    Expanded(
                        flex: 2,
                        child: Text(
    ' '+widget.voice.listens.toString(),
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(89, 101, 111, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0),
                          ),
                          overflow: TextOverflow.ellipsis,
                        )),
                    Expanded(
                        child: Icon(
                      MyVoFo.Repeat,
                      size: 20,
                    )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          ' '+widget.voice.shares.toString(),
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(89, 101, 111, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0),
                          ),
                          overflow: TextOverflow.ellipsis,
                        )),
                    Expanded(
                      child: GestureDetector(
                        onTap: ( () async {
                          Map<String, dynamic> re = await likeVoice(widget.voice.id);
                          if(re['status']){

                          }
                          print(re);
                        }),
                        child: (
                            Icon(
                              MyVoFo.Heart,
                              size: 18,

                            )
                        )
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          ' '+widget.voice.likes.toString(),
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(89, 101, 111, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0),
                          ),
                          overflow: TextOverflow.ellipsis,
                        )),
                    Expanded(
                      child: Icon(
                        MyVoFo.Comment,
                        size: 18,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          ' 9.589',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(89, 101, 111, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0),
                          ),
                          overflow: TextOverflow.ellipsis,
                        )),
                    Expanded(
                        child: GestureDetector(
                      onTap: (() => showShareScreenBottomSheet(context)),
                      child: Icon(
                        Icons.share_outlined,
                        size: 18,
                      ),
                    ))
                  ],
                ),
                (widget.isThread == true)
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AutoSizeText(
                          'Show This Thread',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(0, 159, 183, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 13.0),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Text('')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
