import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharmarx/core/theme/colors.dart';
import 'package:pharmarx/core/theme/typography.dart';

class CustomMainButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String btnText;

  const CustomMainButton({
    super.key,
    required this.onPressed,
    required this.btnText,
  });

  @override
  State<CustomMainButton> createState() => _CustomMainButtonState();
}

class _CustomMainButtonState extends State<CustomMainButton> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primaryRed),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          ),
        ),
        child: Text(
          widget.btnText,
          style: TextStyles.buttonText,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatefulWidget {
  final String btnText;
  final PageRouteInfo routeName;

  const CustomTextButton(
      {super.key, required this.btnText, required this.routeName});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.router.push(widget.routeName);
      },
      child: Text(
        widget.btnText,
        style: TextStyles.textButtonText,
      ),
    );
  }
}