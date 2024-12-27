import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/widgets/add_category_view_body.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});
  static const id = "AddCategoryView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AddCategory"),
      ),
      body: const AddCategoryViewBody(),
    );
  }
}
