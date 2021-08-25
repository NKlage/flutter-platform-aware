import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../platformaware.dart';

class PlatformTextField extends MobileDevice<CupertinoTextField, TextField> {
  final TextEditingController? textController;
  final InputDecoration? materialDecoration;
  final BoxDecoration? cupertinoDecoration;

  const PlatformTextField(
      {Key? key,
      this.textController,
      this.materialDecoration,
      this.cupertinoDecoration})
      : super(key: key);

  @override
  TextField createAndroidWidget(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: materialDecoration,
    );
  }

  @override
  CupertinoTextField createIosWidget(BuildContext context) {
    return CupertinoTextField(
      controller: textController,
      decoration: cupertinoDecoration,
    );
  }
}
