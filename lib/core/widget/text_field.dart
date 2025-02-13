import 'package:flutter/material.dart';
import 'package:pharmarx/core/theme/colors.dart';
import 'package:pharmarx/core/theme/typography.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final String? hintText;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.hintText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyles.labelText, // Text inside input
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyles.labelText,
          hintText: hintText,
          hintStyle: TextStyles.hintText,
          errorText: errorText,
          errorStyle: TextStyles.errorText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGray, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mediumGray, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkGray, width: 2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.softBlue) : null,
        ),
      ),
    );
  }
}
