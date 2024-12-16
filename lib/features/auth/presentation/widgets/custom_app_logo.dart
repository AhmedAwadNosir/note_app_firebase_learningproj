import 'package:flutter/material.dart';
import 'package:note_app/core/utils/app_images.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[100],
      ),
      child: Image.asset(
        height: 50,
        AppImages.appLogo,
        fit: BoxFit.fill,
      ),
    );
  }
}
