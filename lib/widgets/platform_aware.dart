
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

abstract class PlatformAware<IOS extends Widget, ANDROID extends Widget> extends StatelessWidget {
  const PlatformAware({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    switch(defaultTargetPlatform){
      case TargetPlatform.android:
        return createAndroidWidget(context);
      case TargetPlatform.iOS:
        return createIosWidget(context);
      default:
        return Container(
          child: Text('Platform not implemented ($defaultTargetPlatform)'),
        );
    }
  }

  IOS createIosWidget(BuildContext context);
  ANDROID createAndroidWidget(BuildContext context);

}
