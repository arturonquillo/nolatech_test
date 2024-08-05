// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/colors.dart';

class CustomBackButton extends StatelessWidget {
  final Function() onTap;
  const CustomBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: AppColors.thirdColor, // Color de fondo del Material
        borderRadius: BorderRadius.circular(16.0),
        child: InkWell(
          splashColor: AppColors.primaryColor, // Splash color
          highlightColor: AppColors.primaryColor,
          child: Container(
            width: 40.0, 
            height: 40.0, 
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back,
              color: AppColors.light,
              size: 18,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
