import 'package:flutter/material.dart';
import 'package:talkie/style/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? height;
  final double? width;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.white.withOpacity(.05),
      disabledTextColor: kSecondaryBtnText,
      textColor: onPressed != null ? Colors.black : null,
      height: height ?? 50,
      minWidth: width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? height;
  final double? width;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 50,
      minWidth: width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white.withOpacity(.05),
      elevation: 0,
      onPressed: onPressed,
      child: Text(text),
      textColor: kSecondaryBtnText,
    );
  }
}

class StrokeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? height;
  final double? width;
  final Color? background;
  final double? fontSize;

  const StrokeButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.height,
      this.fontSize,
      this.background});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(background),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            side: MaterialStatePropertyAll(
                BorderSide(color: kAccentColor, width: 1))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: kAccentColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
