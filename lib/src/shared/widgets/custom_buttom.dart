import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final CustomButtonStyle style;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool loading;
  final Function()? onPressed;
  CustomButton({
    super.key,
    required this.text,
    this.style = CustomButtonStyle.primary,
    this.padding = const EdgeInsets.symmetric(horizontal: 18),
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    required this.onPressed,
    this.loading = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppColors.thirdColor;
    Color textColor = AppColors.light;
    switch (widget.style) {
      case CustomButtonStyle.primary:
        backgroundColor = AppColors.thirdColor;
        textColor = AppColors.light;
        break;
      case CustomButtonStyle.secondary:
        backgroundColor = AppColors.dark.withOpacity(0.4);
        textColor = AppColors.light;
        break;
      default:
    }

    return Container(
      padding: widget.padding,
      margin: widget.margin,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: FilledButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(backgroundColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        child: widget.loading
            ? LinearProgressIndicator()
            : Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
              ),
      ),
    );
  }
}

enum CustomButtonStyle {
  primary,
  secondary,
}
