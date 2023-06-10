import 'package:flutter/material.dart';

class TextFormFieldWithBorder {
  TextFormField getCustomEditTextArea(
      {String? hintValue = "",
      bool isObscureText = true,
      TextStyle? hintStyle,
      bool? validation,
      Icon? myPrefixIcon,
      IconButton? mySuffixIcon,
      // int? maxLineValue,
      bool? isFilled,
      Color? fillColor,
      TextEditingController? controller,
      TextInputType keyboardType = TextInputType.text,
      TextStyle? textStyle,
      String? validationErrorMsg}) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      obscureText: isObscureText,
      // maxLines: maxLineValue,
      controller: controller,
      validator: (value) {
        if (validation == true && value!.isEmpty) {
          return validationErrorMsg;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintValue,
        filled: isFilled,
        prefixIcon: myPrefixIcon,
        suffixIcon: mySuffixIcon,
        fillColor: fillColor,
        hintStyle: hintStyle,
        errorStyle: const TextStyle(fontSize: 0.01),
        contentPadding:
            EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0, right: 0.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    return textFormField;
  }
}

// decoration: InputDecoration(
// prefixIcon: Icon(Icons.lock, color: Colors.white),
// hintText: "Password",
// hintStyle: TextStyle(color: Colors.white),
// filled: true,
// fillColor: Colors.blueGrey,
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(10)),
// suffixIcon: IconButton(
// icon: Icon(
// _obscureText
// ? Icons.visibility_off
//     : Icons.visibility,
// color: Colors.white),
// onPressed: () {
// _toggle();
// },
// )),
