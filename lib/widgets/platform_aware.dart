
import 'package:flutter/material.dart';
import 'dart:io';

abstract class PlatformAware<IOS extends Widget, ANDROID extends Widget> extends StatelessWidget {
  const PlatformAware({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _platform = Theme.of(context).platform;

    if(TargetPlatform.android == _platform) {
      return createAndroidWidget(context);
    } else if (TargetPlatform.iOS == _platform) {
      return createIosWidget(context);
    } else {
      return Container(
        child: Text('Platform not implemented (${Platform.operatingSystem})'),
      );
    }

  }

  IOS createIosWidget(BuildContext context);
  ANDROID createAndroidWidget(BuildContext context);

}
