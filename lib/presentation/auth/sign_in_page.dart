import 'package:flutter/material.dart';
import 'package:shabake/values/images.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
          child: ListView(
            children: [
              Container(
                height: 250,
                child: Center(
                  child: Image.asset(Images.logo),
                ),
              ),
              TextFormField(
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
                onPressed: () {},
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
                    onPressed: () {},
                  ),
                ],
              )
            ],
          )),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(height: height);
}
