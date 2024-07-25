import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurWidget extends StatelessWidget {
  final Widget child;
  BlurWidget({
    super.key,
    required this.child,
    this.padding,
    required this.borderRadius,
  });

  final EdgeInsets? padding;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
        child: Container(
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: child),
      ),
    );
  }
}
