import 'package:flutter/material.dart';

Future<void> preloadAssetsImages(
  BuildContext context,
  List<String> paths,
) async {
  for (final path in paths) {
    await precacheImage(AssetImage(path), context);
  }
}
