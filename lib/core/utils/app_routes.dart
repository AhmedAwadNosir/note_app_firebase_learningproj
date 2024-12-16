import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/presentation/views/login_view.dart';
import 'package:note_app/features/auth/presentation/views/register_view.dart';
import 'package:note_app/features/auth/states_manager/login/login_cubit.dart';
import 'package:note_app/features/auth/states_manager/login_google/login_google_cubit.dart';
import 'package:note_app/features/auth/states_manager/register/register_cubit.dart';
import 'package:note_app/features/home/data/presentation/views/home_veiw.dart';

import '../../features/auth/states_manager/resset_password/resset_password_cubit.dart';

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    LoginView.id: (context) => MultiBlocProvider(providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => LoginGoogleCubit()),
          BlocProvider(create: (context) => RessetPasswordCubit()),
        ], child: const LoginView()),
    RegisterView.id: (context) => BlocProvider(
          create: (context) => RegisterCubit(),
          child: const RegisterView(),
        ),
    HomeView.id: (context) => const HomeView()
  };
}
