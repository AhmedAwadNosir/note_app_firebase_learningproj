import 'package:flutter/material.dart';
import 'package:note_app/core/utils/app_images.dart';

class NoNotesFound extends StatelessWidget {
  const NoNotesFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          AppImages.appLogo,
          height: 120,
          width: 120,
        ),
        const Text(
          "Add Note!",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.orange),
        )
      ]),
    );
  }
}
