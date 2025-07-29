
import 'package:demo_iti/Widgets/bottom.dart';
import 'package:demo_iti/Widgets/costum_text_field.dart';
import 'package:demo_iti/cubits/signup_cubit/signup_cubit.dart';
import 'package:demo_iti/helper/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final validator = Validator();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CostumTextFormField(
            hintText: 'Name',
            prefixIcon: Icons.person,
            controller: SignupCubit.get(context).userNameController,
            validator: validator.nameValidator(),
          ),
          CostumTextFormField(
            hintText: 'Email',
            prefixIcon: Icons.email,
            controller: SignupCubit.get(context).emailController,
            validator: validator.emailValidator(),
          ),
          CostumTextFormField(
            hintText: 'Password',
            prefixIcon: Icons.password,
            controller: SignupCubit.get(context).passwordController,
            validator: validator.passwordValidator(),
          ),
          CostumTextFormField(
            hintText: "Confirm Password",
            prefixIcon: Icons.password,
            controller: SignupCubit.get(context).confirmPasswordController,
            validator: validator.confirmPasswordValidator(
              orgPasswordGetter:
                  () => SignupCubit.get(context).confirmPasswordController.text,
            ),
          ),
          Bottom(
            text: 'Sign Up',
            color: Color(0xff9C28B2),
            onTap: () async{
              if (formKey.currentState!.validate()) {
               UserCredential? user= await SignupCubit.get(context).signup();
               
              }
            },
          ),
        ],
      ),
    );
  }
}
