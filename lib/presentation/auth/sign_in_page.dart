import 'package:flutter/material.dart';
import 'package:shabake/application/models/auth/sign_in_form_model.dart';
import 'package:shabake/router/route_constants.dart';
import 'package:shabake/values/images.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _signInFormModel = SignInFormModel();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  height: 250,
                  child: Center(
                    child: Image.asset(Images.logo),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (!_signInFormModel.validateEmail(value!)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(15),
                TextFormField(
                  validator: (value) {
                    if (!_signInFormModel.validatePassword(value!)) {
                      return 'Please enter valid password';
                    }
                    return null;
                  },
                  controller: _pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(25),
                MaterialButton(
                  child: Center(
                    child: Text(
                      "ورود",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      print(_pass.text);
                      //_SignInPageState.setState((_SignInPageState)=>_SignInPageState.submitSignIn());
                      //Navigator.pushNamed(context, homeRoute);
                    }
                  },
                  height: 55,
                  shape: StadiumBorder(),
                  color: Theme.of(context).primaryColor,
                ),
                buildSizedBox(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "حساب کاربری ندارید؟",
                    ),
                    MaterialButton(
                      child: Text("ثبت نام",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      onPressed: () {
                        Navigator.pushNamed(context, signUpRoute);
                      },
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(height: height);
}
