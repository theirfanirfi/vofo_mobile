import 'dart:convert';

class HandleException {
   bool status;
   String message;


  HandleException({
     this.status = false,
     this.message = "Invalid Authorization"
});


   factory HandleException.parseException(String e) {
    Map<dynamic, dynamic> values = json.decode(e.substring(11));
    return HandleException(
      status: values["status"],
      message: values["message"],
    );
  }
}