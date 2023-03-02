import 'package:flutter/material.dart';

extension BoxStyle on BoxDecoration {
  static BoxDecoration fromBoxDecoration({
    double? radius,
    Color? color,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(radius ?? 0),
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black.withOpacity(0.3),
          offset: const Offset(0, 1),
        ),
      ],
    );
  }
}
