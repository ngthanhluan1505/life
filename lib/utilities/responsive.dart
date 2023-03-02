import 'package:flutter/material.dart';

class Responsive {
  /* Chia màn hình theo tỷ lệ phần trăm
    height: Responsive.height(50, context) => 50% chiều dọc
    width: Responsive.width(100, context) => 100% chiều ngang
  */
  static width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width * (p / 100);
  }

  static height(double p, BuildContext context) {
    return MediaQuery.of(context).size.height * (p / 100);
  }
}
