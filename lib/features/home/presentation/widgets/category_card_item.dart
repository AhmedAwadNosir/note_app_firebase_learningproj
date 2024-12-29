import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/home/data/models/category_modal.dart';
import 'package:note_app/features/home/presentation/views/notes_view.dart';
import 'package:note_app/features/home/presentation/widgets/category_card_bloc_listner.dart';
import 'package:note_app/features/home/states_manager/dellete_note_category/dellete_note-category_cubit.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({
    super.key,
    required this.categoryModal,
  });
  final CategoryModal categoryModal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showAwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          dialogTitle: '',
          dialogDesc: "do you want to delete this Category",
          btnOkColor: Colors.red,
          btnOkName: "Dellete",
          btnCancelColor: Colors.green,
          btnOkOnPress: () {
            BlocProvider.of<DelleteNoteCategoryCubit>(context)
                .delleteCategory(docId: categoryModal.docId!);
          },
          btnCancelOnPress: () {},
        );
      },
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return NotesView(categoryId: categoryModal.docId!);
          },
        ));
      },
      child: CategroyCardBlocListner(categoryModal: categoryModal),
    );
  }
}
