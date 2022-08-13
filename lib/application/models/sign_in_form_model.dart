import 'package:shabake/application/classes/common_error.dart';

class SignInFormModel {
   String? email;
   String? password;

  void setEmail(String email) {
    if (!validateEmail(email)) {
      throw CommonError(message: "invalide message");
    }
    this.email = email;
  }

  void setPassword(String password) {
    if (password.length < 6) {
      throw CommonError(message: "password lenght shuld be greater than 6");
    }
    this.password = password;
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
  bool validatePassword(String password) {
    return  (password.length > 6);
  }
}


