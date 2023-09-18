import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleTextFormField extends StatefulWidget {
  final Function(String) callBack;
  bool obscureText;
  final String hintText;
  final bool? isPassword;
  final int maxLength;
  final isSearch;
  final maxLines;
  // final keyboardType;
  SimpleTextFormField(
      {required this.obscureText,
      required this.hintText,
      this.isPassword,
      required this.maxLength,
  required this.callBack ,
      this.isSearch,
      this.maxLines,

      // this.keyboardType,
      super.key});

  @override
  State<SimpleTextFormField> createState() => _SimpleTextFormFieldState();
}

class _SimpleTextFormFieldState extends State<SimpleTextFormField> {
  String _enteredText = '';



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextField(
        maxLength: (widget.maxLength != 0) ? widget.maxLength : null,
        obscureText: widget.obscureText,
        onChanged: ((value) {
          _enteredText = value;
          widget.callBack(_enteredText);
          setState(() {_enteredText = value;});
        }),
        maxLines: widget.maxLines,
        // keyboardType: TextInputType.name,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              color: Color.fromRGBO(89, 101, 111, 1),
              fontWeight: FontWeight.w500,
              fontSize: 15.0),
        ),
        decoration: InputDecoration(
            hintText: widget.hintText,
            counterText: (widget.maxLength != 0)
                ? '${_enteredText.length.toString()}/${widget.maxLength}'
                : '',
            filled: true,
            focusColor: (widget.isSearch == true)
                ? Color.fromRGBO(241, 241, 241, 1)
                : Color.fromRGBO(248, 248, 248, 1),
            fillColor: (widget.isSearch == true)
                ? Color.fromRGBO(241, 241, 241, 1)
                : Color.fromRGBO(248, 248, 248, 1),
            focusedBorder: OutlineInputBorder(
                borderSide: (widget.isSearch != true)
                    ? BorderSide(
                        width: 0.8, color: Color.fromRGBO(172, 169, 187, 1))
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: (widget.isSearch != true)
                    ? BorderSide(
                        width: 0.8, color: Color.fromRGBO(172, 169, 187, 1))
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            prefixIcon: (widget.isSearch == true)
                ? Icon(
                    Icons.search_rounded,
                    size: 22,
                    color: Color.fromRGBO(89, 101, 111, 1),
                  )
                : null,
            suffixIcon: (widget.isPassword == true)
                ? InkWell(
                    onTap: () {
                      widget.obscureText = !widget.obscureText;
                      setState(() {});
                    },
                    child: (widget.obscureText == false)
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black,
                            size: 20,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: Colors.black,
                            size: 20,
                          ))
                : null),
      ),
    );
  }
}
