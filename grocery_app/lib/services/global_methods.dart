import 'package:flutter/material.dart';

class GlobalMethods {
  static navigateTo({required BuildContext context, required String route}) {
    Navigator.pushNamed(context, route);
  }
}
