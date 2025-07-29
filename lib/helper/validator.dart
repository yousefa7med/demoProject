class Validator {
  bool _isEmail(String? email) {
    const pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$";
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email ?? "");
  }

  String? Function(String? value) emailValidator(email) {
    return emailValidatorr;
  }

  String? emailValidatorr(String? email) {
    final trimmedEmail = email?.trim();
    if (trimmedEmail == null || trimmedEmail.isEmpty) {
      return "please Enter Your Email";
    } else if (!_isEmail(trimmedEmail)) {
      return "Please Enter an Email";
    }
    return null;
  }

  String? passwordValidator(String? password) {
    final trimmedPassword = password?.trim();
    if (trimmedPassword == null || trimmedPassword.isEmpty) {
      return "please Enter Your Password";
    } else if (password!.length < 8) {
      return "Too Short";
    }
    return null;
  }

  String? confirmPasswordValidator({
    required String? orgPassword,
    required String? password,
  }) {
    final trimmedPassword = password?.trim();
    final trimmedOrgPassword = orgPassword?.trim();
    if (trimmedPassword != trimmedOrgPassword) {
      return "Make sure from your password";
    }
    return null;
  }

  String? nameValidator(String? name) {
    final trimmedName = name?.trim();
    if (trimmedName == null || trimmedName.isEmpty) {
      return "please Enter Your Name";
    }
    if (name!.length < 8) {
      return "Too Short";
    }
    return null;
  }
}
