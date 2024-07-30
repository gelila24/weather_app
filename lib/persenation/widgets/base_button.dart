import 'package:flutter/material.dart';
import 'package:weather_app/persenation/themes/app_theme.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const BaseButton({required this.title, required this.onPressed, super.key});

  @override
    /// Builds the widget tree for this widget which is a simple button.
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          decoration: AppTheme.mainButtonDecoration,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          width: 366,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTheme.secondaryTextStyle.copyWith(color: Colors.white),
          )),
    );
  }
}
