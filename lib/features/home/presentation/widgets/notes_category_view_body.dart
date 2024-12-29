import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/widgets/not_categories_grid_builder_bloc_consumer.dart';

class NotesCategoryViewBody extends StatelessWidget {
  const NotesCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: NotCategoriesGridBuilderBlocConsumer());
  }
}
