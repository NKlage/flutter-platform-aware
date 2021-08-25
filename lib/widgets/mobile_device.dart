
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

abstract class MobileDevice<IOS extends Widget, ANDROID extends Widget> extends StatelessWidget {

  const MobileDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    switch(defaultTargetPlatform){
      case TargetPlatform.android:
        return createAndroidWidget(context);
      case TargetPlatform.iOS:
        return createIosWidget(context);
      default:
        return Text('Platform not implemented ($defaultTargetPlatform)');
    }
  }

  IOS createIosWidget(BuildContext context);

  ANDROID createAndroidWidget(BuildContext context);

}
