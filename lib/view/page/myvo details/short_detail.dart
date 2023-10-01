import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/my_vo_fo_icons.dart';
import 'package:my_vofo/view/page/share%20screens/share_screen.dart';
import 'package:my_vofo/view/widgets/audio_wave.dart';

import '../../../models/Voice.dart';

class ShortDetail extends StatelessWidget {
  final Voice voice;
  const ShortDetail({required this.voice, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0,),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          voice.user.username,
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
                            // Flexible(
                            //   child: AutoSizeText(
                            //     'Smith',
                            //     style: GoogleFonts.inter(
                            //       textStyle: TextStyle(
                            //           color: Color.fromRGBO(59, 59, 59, 1),
                            //           fontWeight: FontWeight.w600,
                            //           fontSize: 17.0),
                            //     ),
                            //     maxLines: 1,
                            //     // overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),
                            Flexible(
                              flex: 2,
                              child: AutoSizeText(
                                '@ '+voice.user.username,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(89, 101, 111, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Flexible(
                            //   child: AutoSizeText(
                            //     ' Just Now',
                            //     style: GoogleFonts.inter(
                            //       textStyle: TextStyle(
                            //           color:
                            //               Color.fromRGBO(89, 101, 111, 1),
                            //           fontWeight: FontWeight.w400,
                            //           fontSize: 13.0),
                            //     ),
                            //     maxLines: 1,
                            //     // overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),
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
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 8),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.84,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(249, 249, 249, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: AudioWave(true, path: voice.voice_record),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: AutoSizeText(
                voice.hash_tags,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(0, 159, 183, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 3.0),
              child: Text(
                voice.created_at.toString(),
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(89, 101, 111, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Divider(
              thickness: 1,
              color: Color.fromRGBO(209, 209, 209, 1),
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
                      ' '+voice.listens.toString(),
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
                      ' '+voice.shares.toString(),
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
                    MyVoFo.Heart,
                    size: 18,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                        ' '+voice.likes.toString(),
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
            Divider(
              thickness: 1,
              color: Color.fromRGBO(209, 209, 209, 1),
            ),
          ],
        ),
      ),
    );
  }
}
