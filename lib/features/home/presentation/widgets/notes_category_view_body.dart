import 'package:flutter/material.dart';
import 'package:note_app/features/home/data/models/category_modal.dart';
import 'package:note_app/features/home/presentation/widgets/category_card_item.dart';

class NotesCategoryViewBody extends StatelessWidget {
  const NotesCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return CategoryItemCard(
            categoryModal:
                CategoryModal(categoryName: "Company", categoryId: ""),
          );
        },
      ),
    );
  }
}
