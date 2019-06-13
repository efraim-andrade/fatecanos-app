import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class TheToast {
  var response, context;
  
  TheToast(this.response, this.context);

  setToast() {
    return Toast.show(
      response["message"], 
      context, 
      gravity: Toast.TOP,
      duration: Toast.LENGTH_LONG,
      backgroundColor: this.getColor(response["status"])
    );
  }

  getColor(status) {
    if(status == null) return Colors.grey;

    if(status != 200) return Colors.redAccent;

    return Colors.greenAccent;
  }
}