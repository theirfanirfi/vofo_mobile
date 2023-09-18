import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/const/my_vo_fo_icons.dart';
import 'package:my_vofo/view/page/myvo%20details/long_vofo.dart';

class Longs extends StatelessWidget {
  final isPromoted;
  const Longs({this.isPromoted, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 270,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LongVoFo()));
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
                              Row(
                                children: [
                                  (isPromoted == true)
                                      ? Icon(
                                          Icons.trending_up,
                                          size: 18,
                                          color:
                                              Color.fromRGBO(83, 153, 135, 1),
                                        )
                                      : Text(''),
                                  AutoSizeText(
                                    (isPromoted == true)
                                        ? ' Promoted'
                                        : 'Followed by Tanya',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(89, 101, 111, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.0),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      'Angel',
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
                                      ' @knightange',
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
                                  // Flexible(
                                  //   child: AutoSizeText(
                                  //     ' 1 Year Ago',
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
                ),
                Container(
                  width: size.width * 0.8,
                  child: AutoSizeText(
                    'Relaxing Piano Music & Water Sounds  Ideal for Stress Relief and Healing',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(59, 59, 59, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, bottom: 5.0),
                      child: Container(
                        width: size.width * 0.8,
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(89, 101, 111, 1),
                            image: DecorationImage(
                                image: AssetImage(ImageData.Longs),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 15,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromRGBO(89, 101, 111, 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '33:59 Long',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Icon(
                      MyVoFo.Listen,
                      size: 18,
                    )),
                    Expanded(
                        flex: 4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ' 19.589',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(89, 101, 111, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '1 Year Ago',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(89, 101, 111, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
