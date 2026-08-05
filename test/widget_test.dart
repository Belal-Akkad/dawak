import 'package:dawak/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dawak/main.dart';

void main() {
  testWidgets('shows the splash artwork', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final image = tester.widget<Image>(find.byType(Image));
    expect((image.image as AssetImage).assetName, AppAssets.logoImage);
  });
}
