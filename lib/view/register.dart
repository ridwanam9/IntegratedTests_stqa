import 'package:finalproject/controller/email_controller.dart';
import 'package:finalproject/controller/username_controller.dart';
import 'package:finalproject/validator/register/password_validator.dart';
import 'package:finalproject/validator/register/telepon_validator.dart';
import 'package:finalproject/validator/register/username_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controller/telepon_controller.dart';
import '../validator/register/email_validator.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final UsernameController usernameController = UsernameController();

  final PasswordValidator passwordValidator = PasswordValidator();
  final UsernameValidator usernameValidator = UsernameValidator();
  final EmailValidator emailValidator = EmailValidator();
  final EmailController emailController = EmailController();
  final TeleponValidator teleponValidator = TeleponValidator();
  final TeleponController teleponController = TeleponController();

  String? name;
  String? email;
  String? password;
  String? no_telp;
  String? username;

  bool _isHidePassword = true;

  bool _isUsernameExist = false;
  bool _isEmailExist = false;
  bool _isTeleponExist = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => name = value,
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) async {
                      email = value;
                      _isEmailExist =
                          await emailController.validateEmail(value);
                      setState(() {
                        _isEmailExist = _isEmailExist;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (emailValidator.validateEmail(value!) != null) {
                        return emailValidator.validateEmail(value);
                      } else if (_isEmailExist == true) {
                        return "Email sudah digunakan";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) async {
                      username = value;
                      _isUsernameExist =
                          await usernameController.validateUsername(value);
                      setState(() {
                        _isUsernameExist = _isUsernameExist;
                      });
                    },
                    controller: _usernameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (usernameValidator.validateUsername(value!) != null) {
                        return usernameValidator.validateUsername(value);
                      } else if (_isUsernameExist == true) {
                        return "Username sudah digunakan";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isHidePassword = !_isHidePassword;
                          });
                        },
                        child: Icon(
                          _isHidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _isHidePassword,
                    onChanged: (value) => password = value,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        passwordValidator.validatePassword(value),
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nomor Telepon',
                      labelText: 'Nomor Telpon',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) async {
                      no_telp = value;
                      _isTeleponExist =
                          await teleponController.validateTelepon(value);
                      setState(() {
                        _isTeleponExist = _isTeleponExist;
                      });
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(15),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (teleponValidator.validateTelepon(value!) != null) {
                        return teleponValidator.validateTelepon(value);
                      } else if (_isTeleponExist == true) {
                        return "Nomor Telepon sudah digunakan";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        print("Name : $name");
                        print("Email : $email");
                        print("Username : $username");
                        print("Password : $password");
                        print("No Telp : $no_telp");
                      }
                    },
                    child: Text("Register"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah Punya Akun?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Login",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
