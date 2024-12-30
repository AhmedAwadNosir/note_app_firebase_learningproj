import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utils/app_routes.dart';
import 'package:note_app/features/auth/presentation/views/login_view.dart';
import 'package:note_app/features/home/presentation/views/notes_categorys_view.dart';
import 'package:note_app/features/home/states_manager/add_note/add_note_cubit.dart';
import 'package:note_app/features/home/states_manager/dellete_note/dellete_note_cubit.dart';
import 'package:note_app/features/home/states_manager/edit_note/edit_note_cubit.dart';
import 'package:note_app/features/home/states_manager/fetch_notes/fetch_notes_cubit.dart';
import 'package:note_app/firebase_options.dart';
import 'features/home/states_manager/add_note_category/add_note_category_cubit.dart';
import 'features/home/states_manager/dellete_note_category/dellete_note-category_cubit.dart';
import 'features/home/states_manager/fetch_notes_categories/fetch_notes_categories_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => FetchNotesCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => DelleteNoteCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider(
          create: (context) => FetchNotesCubit(),
        ),
        BlocProvider(
          create: (context) => DelleteNoteCubit(),
        ),
        BlocProvider(
          create: (context) => EditNoteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.orange),
              elevation: 1,
              titleTextStyle: TextStyle(
                  fontSize: 22,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500),
              actionsIconTheme: IconThemeData(color: Colors.orange)),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          useMaterial3: true,
        ),
        routes: AppRoutes.routes,
        initialRoute: getFirstPage(),
      ),
    );
  }
}

String getFirstPage() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  return auth.currentUser != null ? NotesCategoriesView.id : LoginView.id;
}
