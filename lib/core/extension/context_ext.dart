import 'package:flutter/material.dart';

extension Navigate on BuildContext {
  void pushAndRemove(String name) {
    Navigator.pushNamedAndRemoveUntil(this, name, (r) => false);
  }

  void push(String name) {
    Navigator.pushNamed(this, name);
  }
}
extension KeyBoard on BuildContext {
  void hideKeyBoard() {
    FocusScope.of(this).unfocus();
  }
}

extension TextTheme on BuildContext {
  TextStyle? headLine() {
    return Theme.of(this).textTheme.headline4;
  }
  TextStyle? title() {
    return Theme.of(this).textTheme.headline5;
  }
  TextStyle? body() {
    return Theme.of(this).textTheme.bodyText2;
  }
  Color? primaryColor() {
    return Theme.of(this).primaryColor;
  }
}
