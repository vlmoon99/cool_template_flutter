import 'package:cool_template/assets/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Images.jhipsterFamilyMan,
      width: width,
      height: height,
    );
  }
}
