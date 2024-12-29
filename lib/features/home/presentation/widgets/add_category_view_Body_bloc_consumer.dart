import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/home/presentation/widgets/add_category_view_body.dart';
import 'package:note_app/features/home/states_manager/add_note_category/add_note_category_cubit.dart';
import 'package:note_app/features/home/states_manager/fetch_notes_categories/fetch_notes_categories_cubit.dart';

class AddNoteCategoryViewBodyBlocConsumer extends StatelessWidget {
  const AddNoteCategoryViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCategoryCubit, AddNoteCategoryState>(
      listener: (context, state) {
        if (state is AddNoteCategoryFailure) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              dialogTitle: "Error",
              dialogDesc:
                  "Check Your internet Conection! ${state.errorMessage}");
        }
        if (state is AddNoteCategorySuccess) {
          BlocProvider.of<FetchNotesCategoriesCubit>(context)
              .fetchNotesCategories();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddNoteCategoryLoading,
            child: const AddCategoryViewBody());
      },
    );
  }
}
