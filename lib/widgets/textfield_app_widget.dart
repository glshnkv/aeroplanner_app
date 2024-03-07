import 'package:aeroplanner_app/theme/colors.dart';
import 'package:flutter/material.dart';

class TextFieldAppWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const TextFieldAppWidget(
      {super.key,
        required this.controller,
        required this.hintText,});

  @override
  State<TextFieldAppWidget> createState() => _TextFieldAppWidgetState();
}

class _TextFieldAppWidgetState extends State<TextFieldAppWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white8,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white14, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white14),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.white14,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
