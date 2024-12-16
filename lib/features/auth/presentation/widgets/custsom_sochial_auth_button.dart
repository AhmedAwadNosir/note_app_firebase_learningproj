import 'package:flutter/material.dart';
import 'package:note_app/core/utils/app_images.dart';

class CustsomSochialAuthButton extends StatelessWidget {
  const CustsomSochialAuthButton({
    super.key,
    this.onPressed,
    required this.buttonName,
    this.backgroundColor,
    this.titleColor,
  });
  final void Function()? onPressed;
  final String buttonName;
  final Color? backgroundColor;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonName,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: titleColor ?? Colors.white),
            ),
            const SizedBox(width: 6),
            Image.asset(
              AppImages.googleIonc,
              height: 30,
            )
          ],
        ));
  }
}
