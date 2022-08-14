import 'package:flutter/material.dart';
import 'package:shabake/application/models/sign_up_form_model.dart';
import 'package:shabake/router/route_constants.dart';
import 'package:shabake/values/images.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _signInFormModel = SignUpFormModel();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
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
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  height: 50,
                  child: Center(
                    child: Image.asset(Images.logo),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter your first name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter your last name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(15),
                TextFormField(
                  validator: (value) {
                    if (!_signInFormModel.validateEmail(value!)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
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
                buildSizedBox(15),
                TextFormField(
                  validator: (value) {
                    if (_confirmPass.text.isEmpty) {
                      return 'Please enter passwordConfirmation';
                    } else if (_confirmPass.text != _pass.text) {
                      return 'Please enter valid passwordConfirmation';
                    }
                    return null;
                  },
                  controller: _confirmPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.compare),
                    hintText: "Enter your passwordConfirmation",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(25),
                MaterialButton(
                  child: Center(
                    child: Text(
                      "ثبت",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text('Processing Data'),
                      //     backgroundColor: Colors.green,
                      //   ),
                      // );
                      Navigator.pushNamed(context, homeRoute);
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
                      "حساب کاربری دارید؟",
                    ),
                    MaterialButton(
                      child: Text("ورود",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      onPressed: () {
                        Navigator.pushNamed(context, signInRoute);
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
