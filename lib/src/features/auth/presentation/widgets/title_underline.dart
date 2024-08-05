// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/colors.dart';

class TitleUnderline extends StatelessWidget {
  final String text;
  const TitleUnderline({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Container(
            width: 90,
            height: 1.5,
            margin: EdgeInsets.only(top: 6),
            color: AppColors.secondaryColor,
          )
        ],
      ),
    );
  }
}
