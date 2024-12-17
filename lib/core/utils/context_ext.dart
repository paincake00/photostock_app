import 'package:flutter/material.dart';

/// Context extension
extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
}
