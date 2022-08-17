import 'package:dio/dio.dart';
import 'package:shabake/application/classes/errors/common_error.dart';
import 'package:shabake/base_url.dart';

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
    return (password.length > 6);
  }

  submitSignIn() async {
    Dio dio = new Dio();
    dio.options.baseUrl = BASE_URL;
    Response response = await dio
        .post("/api/auth/login", data: {"email": email, "password": password});
    print(response);
  }
}
