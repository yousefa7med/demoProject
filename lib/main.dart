import 'package:demo_iti/cubits/login_cubit/login_cubit.dart';
import 'package:demo_iti/cubits/signup_cubit/signup_cubit.dart';
import 'package:demo_iti/firebase_options.dart';
import 'package:demo_iti/helper/auth.dart';
import 'package:demo_iti/themes.dart';
import 'package:demo_iti/views/signup_page.dart';
import 'package:demo_iti/views/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final auth =Auth();
  runApp(MyApp(auth:auth ,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.auth});
  final Auth auth;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.loginPageRoute:
            (context) => BlocProvider(
              create: (context) => LoginCubit(auth),
              child: LoginPage(),
            ),
        SignupPage.signupPageRoute:
            (context) => BlocProvider(
              create: (context) => SignupCubit(auth),
              child: SignupPage(),
            ),
      },
      theme: AppTheme.lightTheme,
      home: BlocProvider(create: (context) => LoginCubit(auth), child: LoginPage()),
    );
  }
}
