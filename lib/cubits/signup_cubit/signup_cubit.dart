import 'package:demo_iti/helper/auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final Auth auth = Auth();
  Future<UserCredential?> signup() async {
    UserCredential? user;
    try {
      user = await auth.signUp(emailController.text, passwordController.text);
      emit(SignupLoading());
      await auth.sendVerfiyEmail();
      emit(SignupSuccessed());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(errMsg: e.message!));
      
    }

    return user;
  }

  static SignupCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    confirmPasswordController.dispose();
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    return super.close();
  }
}
