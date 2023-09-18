import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/calls/voice/PostVoiceAPICall.dart';
import 'package:my_vofo/view/widgets/alert_dialog.dart';
import 'package:my_vofo/view/widgets/audio_wave.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';
import 'package:my_vofo/view/widgets/simple_text_form_field.dart';
import 'dart:io';

import '../../../models/HandleException.dart';
class AddShortDetails extends StatefulWidget {
  final String path;
  const AddShortDetails({required this.path, super.key});

  @override
  State<AddShortDetails> createState() => _AddShortDetails();
}
class _AddShortDetails extends State<AddShortDetails> {

  String _hashtags = "";
  String formatWord(String word){
    if(word.startsWith("#")){
      return word;
    }else {
      return "#$word";
    }
  }
  void addHashToWords(String inputString) {
    print(inputString);
    List<String> words = inputString.split(' ');
    List<String> formattedWords = words.map((word) => formatWord(word)).toList();
    print(formattedWords.join(' '));
    setState(() {
      _hashtags = formattedWords.join(' ');
    });
    // return formattedWords.join(' ');
  }
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
                      child: AudioWave(false, path: widget.path),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
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

                    callBack: (val) =>
                    {
                      addHashToWords(val)

                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                  SimpleButton(
                    backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                    text: 'Post MyVo',
                    textColor: Colors.white,
                    onPressed: () async {
                      File file = File(widget.path);
                      // file.openRead();
                      var contents = await file.readAsBytes();
                      var base64File = base64Encode(contents);
                          print(base64File);
                      print(widget.path);
                      try {
                        var response = await postVoice(base64File,false, true, false, _hashtags);
                        var re = jsonDecode(response);
                        if(re['status']){
                          showAlertDialog(context, "Success", re["message"]);
                        }else {
                          showAlertDialog(context, "Error", re["message"]);
                        }
                      }on Exception catch(e){
                        print('e');

                        var handling = HandleException.parseException(e.toString());
                        print(handling.status);
                        print(handling.message);
                        showAlertDialog(context, "Error", handling.message);
                        // Map<dynamic, dynamic> values = json.decode(e.toString().substring(11));
                        // print(values['message']);
                      }

                      },
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
