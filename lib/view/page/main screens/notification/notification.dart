import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/main%20screens/notification/notification_list.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            'Notifications',
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
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(ImageData.Turn_On_Notification),
                        )),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Don’t Miss New Post',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(59, 59, 59, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Get the latest MyVos & Long from your friends',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(89, 101, 111, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.0),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(0, 159, 183, 1),
                                  ),
                                  child: Text(
                                    'Turn On Notification',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.0),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Latest',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(59, 59, 59, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        if (index == 2) {
                          return NotificaionList(
                            isImage: true,
                          );
                        }
                        return NotificaionList();
                      })),
                  Text(
                    'This Week',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(59, 59, 59, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        if (index == 2) {
                          return NotificaionList(
                            isImage: true,
                          );
                        }
                        return NotificaionList();
                      }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
