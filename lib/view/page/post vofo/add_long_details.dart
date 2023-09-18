import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/widgets/audio_wave.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';
import 'package:my_vofo/view/widgets/simple_text_form_field.dart';

class AddLongDetails extends StatelessWidget {
  final String path;
  const AddLongDetails({required this.path, super.key});

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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.84,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          new BoxShadow(
                            color: Color.fromRGBO(148, 202, 221, 0.15),
                            blurRadius: 20.0,
                          ),
                        ]),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: AudioWave(false, path: path),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Title',
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
                    height: 8.0,
                  ),
                  SimpleTextFormField(
                    hintText: '#musicrelax',
                    obscureText: false,
                    maxLength: 100,
                    callBack: (val) => print(val),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
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
                    height: 8.0,
                  ),
                  SimpleTextFormField(
                    hintText: '#musicrelax',
                    obscureText: false,
                    maxLength: 500,
                    maxLines: 3,
                    callBack: (val) => print(val),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '#Hash Tags',
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
                    height: 8.0,
                  ),
                  SimpleTextFormField(
                    hintText: '#musicrelax',
                    obscureText: false,
                    maxLength: 500,
                    maxLines: 3,
                    callBack: (val) => print(val),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 248, 248, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromRGBO(172, 169, 187, 1))),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Upload Thumbnail',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(89, 101, 111, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(ImageData.Longs),
                                  fit: BoxFit.cover)),
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                  SimpleButton(
                    backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                    text: 'Post Long',
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
