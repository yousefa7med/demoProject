import 'package:demo_iti/cubits/login_cubit/login_cubit.dart';
import 'package:demo_iti/cubits/signup_cubit/signup_cubit.dart';
import 'package:demo_iti/firebase_options.dart';
import 'package:demo_iti/themes.dart';
import 'package:demo_iti/views/signup_page.dart';
import 'package:demo_iti/views/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.loginPageRoute:
            (context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginPage(),
            ),
        SignupPage.signupPageRoute:
            (context) => BlocProvider(
              create: (context) => SignupCubit(),
              child: SignupPage(),
            ),
      },
      theme: AppTheme.lightTheme,
      home: BlocProvider(create: (context) => LoginCubit(), child: LoginPage()),
    );
  }
}
