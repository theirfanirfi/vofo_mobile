import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/const/my_vo_fo_icons.dart';
import 'package:my_vofo/view/page/share%20screens/share_screen.dart';
import 'package:my_vofo/view/widgets/audio_wave.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';

class LongDetail extends StatelessWidget {
  const LongDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 5.0),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(89, 101, 111, 1),
                    image: DecorationImage(
                        image: AssetImage(ImageData.Longs), fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                bottom: 60,
                right: 165,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromRGBO(224, 243, 246, 0.8),
                  child: Icon(
                    Icons.play_arrow,
                    size: 20,
                  ),
                )),
            Positioned(
              bottom: 12,
              right: 15,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '00:59/33:59',
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
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        AutoSizeText(
          'Relaxing Piano Music & Water Sounds  Ideal for Stress Relief and Healing',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: Color.fromRGBO(59, 59, 59, 1),
                fontWeight: FontWeight.w600,
                fontSize: 17.0),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                child: Icon(
              MyVoFo.Listen,
              size: 18,
            )),
            Flexible(
                flex: 2,
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
            Flexible(
                child: Icon(
              MyVoFo.Heart,
              size: 18,
            )),
            Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' 100K',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(89, 101, 111, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            Flexible(
                child: Container(
                    height: 25,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Color.fromRGBO(172, 169, 187, 1),
                    ))),
            Flexible(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
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
            Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: (() => showShareScreenBottomSheet(context)),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.share_outlined,
                      size: 18,
                    ),
                  ),
                ))
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Divider(
          thickness: 1,
          color: Color.fromRGBO(209, 209, 209, 1),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0,),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Smith',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(89, 101, 111, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      '@smith_oran ',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(89, 101, 111, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 17.0),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ]),
            ),
            Expanded(
                flex: 2,
                child: SimpleButton(
                    backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                    text: '250 Followers',
                    textColor: Colors.white,
                    onPressed: () {}))
          ],
        ),
        Divider(
          thickness: 1,
          color: Color.fromRGBO(209, 209, 209, 1),
        ),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                color: Color.fromRGBO(59, 59, 59, 1),
                fontWeight: FontWeight.w400,
                fontSize: 15.0),
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
       Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
         child: Text(
                        'More',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
       ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 8),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              // color: Colors.red,
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              MyVoFo.Comment,
                              size: 20,
                            ),
                            Text(
                              ' 9.589',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(89, 101, 111, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                              Icons.expand_more,
                              size: 20,
                            ),
                        )))
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: AudioWave(false, path: ''),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
