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

  Future<UserCredential?> login(String email, String password) async {
    UserCredential? user;
    try {
      emit(LoginLoading());
      user = await auth.login(email, password);
      emit(LoginSuccessed());


    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        emit(LoginFailure(errMsg: "Email or Password isn't correct"));
      } else {
        emit(LoginFailure(errMsg: e.message!));
      }
    }
    return user;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
