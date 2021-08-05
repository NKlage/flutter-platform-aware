import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'mocks/platform_aware_scaffold_mock.dart';

void main() {

  Widget buildMaterialApp() {
    return MaterialApp(
      home: PlatformAwareScaffoldMock(),
    );
  }

  group('PlatformAwareScaffold >', () {

    testWidgets(
      'displays CupertinoPageScaffold on iOS',
          (tester) async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        await tester.pumpWidget(buildMaterialApp());

        expect(find.byType(CupertinoPageScaffold), findsOneWidget);
        expect(find.byType(CupertinoNavigationBar), findsOneWidget);
        debugDefaultTargetPlatformOverride = null;
      },
    );

    testWidgets(
      'displays Scaffold on Android',
          (tester) async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        await tester.pumpWidget(buildMaterialApp());

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
        debugDefaultTargetPlatformOverride = null;
      },
    );

    testWidgets(
      'displays Container on other platform',
          (tester) async {

        debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
        String expectedText = 'Platform not implemented ($debugDefaultTargetPlatformOverride)';

        await tester.pumpWidget(buildMaterialApp());

        expect(find.byType(Container), findsOneWidget);
        expect(find.text(expectedText), findsOneWidget);
        debugDefaultTargetPlatformOverride = null;
      },
    );
  });
}
