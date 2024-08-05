import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/colors.dart';

class Select extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const Select({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: AppColors.light,
        surfaceTintColor: AppColors.light,
        shadowColor: AppColors.light,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.dark.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
        ),
        child: InkWell(
          splashColor: AppColors.primaryColor, // Splash color
          // highlightColor: AppColors.primaryColor,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
