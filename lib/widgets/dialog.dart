import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life/config/utilities/hex_color.dart';
import 'package:life/theme/style.dart';

extension ShowingDialog on Dialog {
  static showingDialog({
    double? height,
    double? width,
    bool? iconClose,
    Widget? widget,
    required BuildContext context,
  }) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(25)),
            backgroundColor: HexColor.fromHex("E0F9E7"),
            child: SizedBox(
              height: height ?? 300,
              width: width ?? 600,
              child: Stack(
                children: [
                  widget ?? const SizedBox(),
                  iconClose ?? true
                      ? Padding(
                          padding: const EdgeInsets.all(15),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxStyle.fromBoxDecoration(
                                      radius: 50,
                                      color: HexColor.fromHex('F80E0E')),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "X",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        shadows: [
                                          const Shadow(
                                            offset: Offset(0, 4),
                                            blurRadius: 3.0,
                                            color: Color.fromARGB(25, 3, 3, 3),
                                          )
                                        ],
                                        color: Colors.white,
                                        letterSpacing: 2),
                                  ),
                                ),
                              )))
                      : const SizedBox()
                ],
              ),
            ),
          );
        });
  }
}
