// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/colors.dart';

class CustomTextFormfield extends StatefulWidget {
  final String title;
  final String? error;
  final String? hintText;
  final IconData? prefixIcon;
  final bool isObscured;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  bool showText = false;

  CustomTextFormfield(
      {super.key,
      this.prefixIcon,
      this.isObscured = false,
      required this.title,
      this.hintText,
      required this.controller,
      this.textInputAction,
      this.error, this.onChanged});

  @override
  State<CustomTextFormfield> createState() => _CustomTextFormfieldState();
}

class _CustomTextFormfieldState extends State<CustomTextFormfield> {
  switchObscure() {
    setState(() {
      widget.showText = !widget.showText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: widget.controller,
        onTapOutside: (tap) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        textInputAction: widget.textInputAction,
        obscureText: !widget.showText && widget.isObscured,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          // hintText: widget.hintText,
          labelText: widget.title,
          fillColor: Colors.black,
          // prefix: Icon(Icons.),
          contentPadding: EdgeInsets.only(bottom: 14),
          alignLabelWithHint: true,
          errorText: widget.error,
          suffixIcon: widget.isObscured
              ? IconButton(
                  onPressed: () {
                    switchObscure();
                  },
                  icon: widget.showText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off))
              : null,
          prefixIcon: widget.prefixIcon != null
              ? Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 20,
                  child: Row(
                    children: [
                      Icon(
                        widget.prefixIcon,
                        size: 18,
                      ),
                      Container(
                        width: 1,
                        height: 18,
                        margin: EdgeInsets.only(left: 10),
                        color: AppColors.dark,
                      )
                    ],
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
