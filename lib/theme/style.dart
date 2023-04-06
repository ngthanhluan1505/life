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

extension ButtonPrimary on ElevatedButton {
  static ElevatedButton button({
    double? height,
    double? width,
    double? radius,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? overlayColor,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
    Function()? onClick,
  }) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor ??
              Colors.blue), // set the background color of the button
          foregroundColor: MaterialStateProperty.all<Color>(foregroundColor ??
              Colors.grey), // set the text color of the button
          overlayColor: MaterialStateColor.resolveWith((states) =>
              overlayColor ??
              Colors
                  .lightBlueAccent), // set the color when the button is pressed
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 18.0),
            ),
          )),
      child: SizedBox(
        height: height ?? 50,
        width: width ?? 300,
        child: Center(
            child: Text(
          'Button',
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 20,
              fontWeight: fontWeight ?? FontWeight.bold),
        )),
      ),
    );
  }
}

extension InputField on TextFormField {
  static TextFormField inputText(
      {String? Function(String?)? validator,
      String? labelText,
      String? hintText,
      Widget? prefixIcon}) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText ?? 'Text',
        hintText: hintText ?? 'Enter your text',
        prefixIcon: prefixIcon ?? const Icon(Icons.email_outlined),
        border: const OutlineInputBorder(),
      ),
    );
  }

  static TextFormField inputPassword(
      {String? Function(String?)? validator,
      required bool isPasswordVisible,
      String? labelText,
      String? hintText,
      Widget? prefixIcon,
      required Function() onclickHidden}) {
    return TextFormField(
      validator: validator,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
          labelText: labelText ?? 'Password',
          hintText: hintText ?? 'Enter your password',
          prefixIcon: prefixIcon ?? const Icon(Icons.lock_outline_rounded),
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility),
            // onPressed: () {
            //   // setState(() {
            //   //   isPasswordVisible = !isPasswordVisible;
            //   // });
            // },
            onPressed: onclickHidden,
          )),
    );
  }
}
