import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';
import 'package:my_vofo/view/widgets/simple_text_form_field.dart';

showSendViaMessageBottomSheet(BuildContext context) {
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
        height: 550,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Send Via Message',
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    height: 45,
                    child: SimpleTextFormField(
                      obscureText: false,
                      hintText: 'Search Messages',
                      maxLength: 0,
                      isSearch: true,
                      callBack: (val) => print(val),
                    )),
              ),
              Divider(
                thickness: 1,
                color: Color.fromRGBO(209, 209, 209, 1),
              ),
              Container(
                height: 300,
                child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 22,
                              backgroundImage: NetworkImage(
                                  'https://media.istockphoto.com/id/1300972574/photo/millennial-male-team-leader-organize-virtual-workshop-with-employees-online.jpg?b=1&s=170667a&w=0&k=20&c=96pCQon1xF3_onEkkckNg4cC9SCbshMvx0CfKl2ZiYs='),
                            ),
                            title: Text(
                              'John Doe',
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
                              '@jDoe',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(89, 101, 111, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        })),
              ),
              Divider(
                thickness: 1,
                color: Color.fromRGBO(209, 209, 209, 1),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        height: 50,
                        child: SimpleTextFormField(
                          obscureText: false,
                          hintText: 'Add Comments',
                          maxLength: 0,
                          callBack: (val) => print(val),
                        )),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: SimpleButton(
                          backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                          text: 'Send',
                          textColor: Colors.white,
                          onPressed: () {}),
                    ),
                  ))
                ],
              ),
              // Padding(
              //     padding: const EdgeInsets.all(12.0),
              //     child: Container(
              //         height: 45,
              //         child: SimpleTextFormField(
              //           obscureText: false,
              //           hintText: 'Add Comments',
              //           maxLength: 0,
              //         )),
              //   ),
              // Container(
              //   height: 50,
              //   child: Row(
              //     children: [
              //       Padding(
              //       padding: const EdgeInsets.all(12.0),
              //       child: Container(
              //           height: 45,
              //           child: SimpleTextFormField(
              //             obscureText: false,
              //             hintText: 'Search Messages',
              //             maxLength: 0,
              //             isSearch: true,
              //           )),
              //     ),
              //     ],
              //   ),
              // )
            ],
          ),
        )),
      );
    },
  );
}
