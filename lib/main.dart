import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/utils/app_routes.dart';
import 'package:note_app/features/auth/presentation/views/login_view.dart';
import 'package:note_app/features/home/presentation/views/notes_categorys_view.dart';
import 'package:note_app/firebase_options.dart';

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
    return MaterialApp(
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
    );
  }
}

String getFirstPage() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  return auth.currentUser != null ? NotesCategoriesView.id : LoginView.id;
}
