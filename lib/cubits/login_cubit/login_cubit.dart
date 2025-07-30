import 'package:bloc/bloc.dart';
import 'package:demo_iti/helper/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.auth) : super(LoginInitial());
  final Auth auth;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<UserCredential> login(String email, String password) {
   return auth.login(email, password);
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
