import 'package:flutter/material.dart';

import '../../constants/constant_color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextStyle? errorTextStyle;

  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? inputTextStyle;

  final Widget? suffix;
  final Icon? prefixIcon;

  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final String? Function(String?)? validation;

  final TextInputType? textInputType;
  final bool obscureText;
  final bool? isDense;

  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;

  final bool? filled;
  final Color? fillColor;




  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffix,
    this.prefixIcon,
    this.contentPadding,
    this.controller,
    this.validation,
    this.textInputType,
    required this.obscureText,
    this.isDense,
    this.errorBorder,
    this.focusedBorder,
    this.enabledBorder,
    this.focusedErrorBorder,
    this.filled,
    this.fillColor,
    this.hintTextStyle,
    this.inputTextStyle, this.errorTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: textInputType?? TextInputType.text,
      style: inputTextStyle,

      validator: validation,
      controller: controller,

      obscureText: obscureText,



      decoration: InputDecoration(

          hintText:hintText?? "Enter your hint text",
          hintStyle: hintTextStyle,

          filled:filled ?? false,
          fillColor: fillColor,

          enabledBorder:enabledBorder?? OutlineInputBorder(
              borderSide: BorderSide(color:ConstantColor.formEnableBorder ),
              borderRadius: BorderRadius.all(Radius.circular(17))
          ),

          focusedBorder: focusedBorder?? OutlineInputBorder(
              borderSide: BorderSide(color:ConstantColor.formFocusBorder ),
              borderRadius: BorderRadius.all(Radius.circular(17))
          ),

          focusedErrorBorder: focusedErrorBorder?? OutlineInputBorder(
              borderSide: BorderSide(color:ConstantColor.formFocusErrorBorder ),
              borderRadius: BorderRadius.all(Radius.circular(17))
          ),

          errorBorder:errorBorder?? OutlineInputBorder(
              borderSide: BorderSide(color:ConstantColor.formErrorBorder ),
              borderRadius: BorderRadius.all(Radius.circular(17))
          ),

          prefixIcon: prefixIcon,
          suffix: suffix,

          isDense:isDense,

          contentPadding: contentPadding,
          errorStyle: errorTextStyle,

      ),

    );

  }
}
