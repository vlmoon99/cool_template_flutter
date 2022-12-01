import 'package:cool_template/shared_widgets/debounce_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  final Color color;
  const AuthButton({
    Key? key,
    required this.child,
    required this.onPress,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DebounceButton(
      onPressed: onPress,
      child: Container(
        width: 50.w,
        height: 12.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
