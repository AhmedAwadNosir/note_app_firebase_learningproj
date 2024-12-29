import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/home/data/models/category_modal.dart';
import 'package:note_app/features/home/presentation/widgets/category_card_item.dart';
import 'package:note_app/features/home/presentation/widgets/no_notes_categories.dart';
import 'package:note_app/features/home/states_manager/fetch_notes_categories/fetch_notes_categories_cubit.dart';

class NotCategoriesGridBuilderBlocConsumer extends StatelessWidget {
  const NotCategoriesGridBuilderBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModal> categories = [];
    return BlocConsumer<FetchNotesCategoriesCubit, FetchNotesCategoriesState>(
      listener: (context, state) {
        if (state is FetchNotesCategoriesFailure) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              dialogTitle: "Error",
              dialogDesc:
                  "Check Your internet Conection! ${state.errorMessage}");
        }
        if (state is FetchNotesCategoriesSuccess) {
          categories = state.categories;
          log(state.categories.length.toString());
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is FetchNotesCategoriesLoading,
          child: categories.isEmpty
              ? const NoNoteCategories()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItemCard(
                      categoryModal: categories[index],
                    );
                  },
                ),
        );
      },
    );
  }
}
