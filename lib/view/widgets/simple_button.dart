import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';

class SimpleButton extends StatelessWidget {
  final backgroundColor;
  final text;
  final textColor;
  final textImage;
  final borderColor;
  final onPressed;
  final isProfile;
  const SimpleButton(
      {required this.backgroundColor,
      required this.text,
      required this.textColor,
      required this.onPressed,
      this.textImage,
      this.borderColor,
      this.isProfile,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    width: 0.8,
                    color: (borderColor == null)
                        ? Color.fromRGBO(0, 159, 183, 1)
                        : borderColor)
                // side: BorderSide(
                //     width: 1, color: Color.fromRGBO(0, 159, 183, 1))
                )),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (textImage != null)
                  ? Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image(
                          image: AssetImage(textImage),
                          width: 20,
                        ),
                      ))
                  : Text(''),
              Flexible(
                flex: 5,
                child: (isProfile == false || isProfile == null)
                    ? AutoSizeText(
                        text,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : AutoSizeText(
                        text,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 1.0),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
