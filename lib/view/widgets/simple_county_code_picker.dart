import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_vofo/view/widgets/simple_text_form_field.dart';

class SimpleCountryCodePicker extends StatefulWidget {
  final Function(String) callBack;

  const SimpleCountryCodePicker({required this.callBack, super.key});
  @override
  State<SimpleCountryCodePicker> createState() => _SimpleCountryCodePicker();
}

class _SimpleCountryCodePicker extends State<SimpleCountryCodePicker> {

  String countryCode = "+91";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CountryCodePicker(
          initialSelection: 'IN',
          showCountryOnly: true,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
          onChanged: (val) => setState(() {
          countryCode=val.toString();
          }),
        ),
        Flexible(
            flex: 2,
            child: SimpleTextFormField(
              hintText: 'Enter Your Mobile Number',
              obscureText: false,
              maxLength: 0,
              callBack: (val) => widget.callBack("$countryCode $val"),
            )),
      ],
    );
  }
}
