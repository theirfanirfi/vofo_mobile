import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/post%20vofo/add_long_details.dart';
import 'package:my_vofo/view/widgets/audio_wave.dart';

import 'add_short_details.dart';

showPreviewBottomSheet(BuildContext context, bool isShort, String? path) {
  return showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
    ),
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    builder: (BuildContext _) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.centerLeft,
                child: Text(
                  (isShort == false) ? 'Long Preview' : 'My Vos Preview',
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
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.84,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(0, 159, 183, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: AudioWave(false, path: path.toString()),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            ListTile(
              leading: Image.asset(ImageData.Discard),
              title: Text(
                'Discard',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(59, 59, 59, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'You can\'t get it back if you throw it away',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(89, 101, 111, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: (() {
                if (isShort == false) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddLongDetails(path: path.toString())));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddShortDetails(path: path.toString())));
                }
              }),
              child: ListTile(
                leading: Image.asset(
                  ImageData.Add_Details,
                ),
                title: Text(
                  'Add Details',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color.fromRGBO(59, 59, 59, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  'Add some additional information',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color.fromRGBO(89, 101, 111, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        )),
      );
    },
  );
}
