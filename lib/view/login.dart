import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/controller/auth_controller.dart';
import 'package:finalproject/model/auth_model.dart';
import 'package:finalproject/validator/login/auth_validator.dart';
import 'package:finalproject/view/dashboard.dart';
import 'package:finalproject/view/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'admin_dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthModel authModel = AuthModel();
  AuthController authController = AuthController();
  AuthValidator authValidator = AuthValidator();
  final _formkey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? token;

  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Text("Email/Username",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email/Username',
                    labelText: 'Email/Username',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => email = value,
                  validator: (value) => authValidator.ValidateEmail(value),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text("Password",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) => password = value,
                  validator: (value) => authValidator.ValidatePassword(value),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        if (await authController.login(email!, password!)) {
                          if (await authController.isAdmin(email!) == true) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DashboardAdmin(emaillogin: email!)));
                          } else
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Dashboard(emaillogin: email!)));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Login Gagal"),
                              content:
                                  Text("Email/Username atau Password salah"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                )
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: Text("Login"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () {
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (context) => Register());
                        Navigator.push(context, route);
                      },
                      child: Text("Register"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
