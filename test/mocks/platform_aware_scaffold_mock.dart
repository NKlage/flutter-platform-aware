import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_aware/platformaware.dart';

class PlatformAwareScaffoldMock
    extends PlatformAware<CupertinoPageScaffold, Scaffold> {
   const PlatformAwareScaffoldMock({Key? key}) : super(key: key);

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold'),
      ),
      body: const Text('Android Widgets'),
    );
  }

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Text('iOS Widget'),
      navigationBar: CupertinoNavigationBar(
        leading: Text('CupertinoNavigationBar'),
      ),
    );
  }
}
