import 'package:flutter/material.dart';
import 'package:note_app/core/utils/app_images.dart';
import 'package:note_app/features/home/data/models/category_modal.dart';
import 'package:note_app/features/home/data/presentation/views/notes_view.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({
    super.key,
    required this.categoryModal,
  });
  final CategoryModal categoryModal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return NotesView(categoryId: categoryModal.categoryId);
          },
        ));
      },
      child: Card(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                AppImages.folderIcon,
                height: 120,
                width: 120,
              ),
              Text(
                categoryModal.categoryName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
