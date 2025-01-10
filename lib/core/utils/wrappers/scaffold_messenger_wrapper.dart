import 'package:flutter/material.dart';

class ScaffoldMessengerWrapper {
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _DefaultSnackBar(
        message: message,
      ),
    );
  }
}

class _DefaultSnackBar extends SnackBar {
  final String message;

  _DefaultSnackBar({
    required this.message,
  }) : super(content: Text(message));
}
