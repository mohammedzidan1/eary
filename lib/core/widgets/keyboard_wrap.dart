import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyboardWrap extends StatelessWidget {
  const KeyboardWrap({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
        builder: (_, bool isKeyboardShow) => SingleChildScrollView(
              child: Column(
                children: [
                  child,
                  if (isKeyboardShow) SizedBox(height: 280.h),
                ],
              ),
            ));
  }
}
