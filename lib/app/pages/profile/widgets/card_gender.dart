import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkie/style/app_color.dart';

class CardGender extends StatelessWidget {
  final String imagePath;
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const CardGender({
    super.key,
    required this.text,
    required this.imagePath,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? kAccentColor : kBorderColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/$imagePath'),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? kAccentColor : kSecondaryBtnText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
