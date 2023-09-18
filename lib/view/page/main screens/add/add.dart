import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/post%20vofo/timer.dart';

showBrandsBottomSheet(BuildContext context) {
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
        height: 180,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => RecordTimer(
                              isShort: true,
                            ))));
              }),
              child: ListTile(
                leading: Image.asset(ImageData.Create_MyVo),
                title: Text(
                  'Create MyVo',
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
                  'create MyVo up to 30s',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color.fromRGBO(89, 101, 111, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  size: 20,
                  color: Color.fromRGBO(172, 169, 187, 1),
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => RecordTimer(
                              isShort: false,
                            ))));
              }),
              child: ListTile(
                leading: Image.asset(ImageData.Create_MyVo),
                title: Text(
                  'Create Long',
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
                  'Create MyVo as long as you want',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color.fromRGBO(89, 101, 111, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  size: 20,
                  color: Color.fromRGBO(172, 169, 187, 1),
                ),
              ),
            )
          ],
        )),
      );
    },
  );
}
