import 'package:flutter/material.dart';

void hideOverLayLoadingIndicator(BuildContext context) {
  final navigator = Navigator.of(context, rootNavigator: true);
  if (navigator.canPop()) {
    navigator.pop();
  }
}