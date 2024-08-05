import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/colors.dart';

class CustomDropDown extends StatefulWidget {
  final Function(String? val) onChanged;
  final String hintText;
  final String? selectedValue;
  final List<String> items;
  const CustomDropDown(
      {super.key,
      required this.onChanged,
      required this.hintText,
      required this.items,
      required this.selectedValue});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: AppColors.light, borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.hardEdge,
      child: DropdownButtonFormField<String>(
        padding: EdgeInsets.zero,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:
                BorderSide(width: 1.5, color: AppColors.dark.withOpacity(0.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:
                BorderSide(width: 1.5, color: AppColors.dark.withOpacity(0.2)),
          ),
          filled: false,
          fillColor: AppColors.light,
        ),
        hint: SizedBox(
            child: Text(
          widget.hintText,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        )),
        value: widget.selectedValue,
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          );
        }).toList(),
        onChanged: (value) {
          widget.onChanged(value);
        },
      ),
    );
  }
}
