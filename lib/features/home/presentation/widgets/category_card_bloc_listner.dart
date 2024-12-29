import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utils/app_images.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/home/data/models/category_modal.dart';
import 'package:note_app/features/home/states_manager/dellete_note_category/dellete_note-category_cubit.dart';
import 'package:note_app/features/home/states_manager/fetch_notes_categories/fetch_notes_categories_cubit.dart';

class CategroyCardBlocListner extends StatelessWidget {
  const CategroyCardBlocListner({
    super.key,
    required this.categoryModal,
  });

  final CategoryModal categoryModal;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DelleteNoteCategoryCubit, DelleteNoteCategoryState>(
      listener: (context, state) {
        if (state is DelleteNoteCategroyFailure) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              dialogTitle: "Error",
              dialogDesc:
                  "Check Your internet Conection! ${state.errorMessage}");
        }
        if (state is DelleteNoteCategroySuccess) {
          BlocProvider.of<FetchNotesCategoriesCubit>(context)
              .fetchNotesCategories();
        }
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
