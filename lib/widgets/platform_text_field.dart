import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_aware/platformaware.dart';

class PlatformTextField extends PlatformAware<CupertinoTextField, TextField> {
  final TextEditingController? textController;

  const PlatformTextField({Key? key, this.textController}) : super(key: key);

  @override
  TextField createAndroidWidget(BuildContext context) {
    return TextField(
      controller: textController,
    );
  }

  @override
  CupertinoTextField createIosWidget(BuildContext context) {
    return CupertinoTextField(
      controller: textController,
    );
  }
}
