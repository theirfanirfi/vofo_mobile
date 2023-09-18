import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/const/my_vo_fo_icons.dart';
import 'package:my_vofo/view/page/share%20screens/send_via_message.dart';

showShareScreenBottomSheet(BuildContext context) {
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
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Share MyVo',
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
              const SizedBox(
                height: 8.0,
              ),
              GestureDetector(
                onTap: (() => showSendViaMessageBottomSheet(context)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(224, 243, 246, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          MyVoFo.Message,
                          color: Color.fromRGBO(0, 159, 183, 1),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Send Via Message',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(0, 159, 183, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0),
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Divider(
                thickness: 1,
                color: Color.fromRGBO(209, 209, 209, 1),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Share To',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(59, 59, 59, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                          height: 50,
                          child: Image.asset(
                            ImageData.Whatsapp,
                            fit: BoxFit.contain,
                          )),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Whatsapp',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                          height: 50,
                          child: Image.asset(
                            ImageData.Instagram,
                            fit: BoxFit.contain,
                          )),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Instagram',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                          height: 50,
                          child: Image.asset(
                            ImageData.Facebook,
                            fit: BoxFit.contain,
                          )),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Facebook',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                          height: 50,
                          child: Image.asset(
                            ImageData.CopyLink,
                            fit: BoxFit.contain,
                          )),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Copy Link',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                          height: 50,
                          child: Image.asset(
                            ImageData.ShareApp,
                            fit: BoxFit.contain,
                          )),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Share App',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ))
                ],
              )
            ],
          ),
        )),
      );
    },
  );
}
