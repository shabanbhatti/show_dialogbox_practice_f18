import 'dart:async';

import 'package:flutter/material.dart';
import 'package:show_dialogbox_classf18/confirmPassword.dart';
import 'package:show_dialogbox_classf18/email.dart';
import 'package:show_dialogbox_classf18/name.dart';
import 'package:show_dialogbox_classf18/password.dart';
import 'package:show_dialogbox_classf18/showDialog.dart';

void main(List<String> args) {
  runApp(const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var emailController = TextEditingController();
  var emailFocusNode = FocusNode();
  var emailFormKey = GlobalKey<FormState>();
  var emailMyOwnKey = false;

  var nameController = TextEditingController();
  var nameFocusNode = FocusNode();
  var nameFormKey = GlobalKey<FormState>();
  var nameMyOwnKey = false;

  var passwordController = TextEditingController();
  var passwordFocusNode = FocusNode();
  var passwordFormKey = GlobalKey<FormState>();
  var passwordMyOwnKey = false;

  var confirmPasswordController = TextEditingController();
  var confirmPasswordFocusNode = FocusNode();
  var confirmPasswordKey = GlobalKey<FormState>();
  var confirmPasswordMyOwnKey = false;

  var buttonFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void buttonSaveAction() {
    emailFormKey.currentState!.validate();

    nameFormKey.currentState!.validate();
    passwordFormKey.currentState!.validate();
    confirmPasswordKey.currentState!.validate();

    var list = <String>[];

    if (nameController.text.isEmpty) {
      list.add('Name');
    }
    if (emailController.text.isEmpty) {
      list.add('Email');
    }
    if (passwordController.text.isEmpty) {
      list.add('Password');
    }
    if (confirmPasswordController.text.isEmpty) {
      list.add('Confirm Password');
    }

    if (list.isNotEmpty) {
      myShowDialog(
          context: context,
          fieldInput:
              "${list.length == 2 ? list.join(',') : list.length == 1 ? list : ''} ${list.length == 4 ? 'All fields are empty' : list.length == 3 ? 'Some fields are empty' : list.length == 2 ? 'are empty' : 'is empty'}");
    } else if (nameMyOwnKey == true &&
        emailMyOwnKey == true &&
        passwordMyOwnKey == true &&
        confirmPasswordMyOwnKey == true) {
      submittedDialog(context: context);
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
    } else {
      showDialogErrorOnly(context: context);
      Timer(
        const Duration(seconds: 2),
        () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  var emailContext = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Flexible(
                child: FittedBox(
                  child: Icon(
                    Icons.android,
                    size: 100,
                  ),
                ),
              ),
              EnterYourEmail(
                validator: (value) {
                  if (emailController.text.isEmpty) {
                    emailMyOwnKey = false;
                    return 'Field should not be null';
                  } else if (!RegExp(emailContext)
                      .hasMatch(emailController.text)) {
                    emailMyOwnKey = false;
                    return 'Invalid email form';
                  } else {
                    emailMyOwnKey = true;
                    return null;
                  }
                },
                myOwnKey: emailMyOwnKey,
                focusNode: emailFocusNode,
                formKey: emailFormKey,
                controller: emailController,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(nameFocusNode);
                },
              ),
              EnterYourName(
                validator: (value) {
                  if (nameController.text.isEmpty) {
                    nameMyOwnKey = false;
                    return 'Field should not be null';
                  } else if (!RegExp('[A-Z]').hasMatch(nameController.text)) {
                    nameMyOwnKey = false;
                    return 'Name must contain upper case alphabets';
                  } else if (!RegExp('[a-z]').hasMatch(nameController.text)) {
                    nameMyOwnKey = false;
                    return 'Name must contain lower case alphabets';
                  } else if (!RegExp('[\\s]').hasMatch(nameController.text)) {
                    nameMyOwnKey = false;
                    return 'Name must contain spaces';
                  } else if (value!.length <= 10) {
                    nameMyOwnKey = false;
                    return 'Name must be greater than 7 words';
                  } else {
                    nameMyOwnKey = true;
                    return null;
                  }
                },
                controller: nameController,
                focusNode: nameFocusNode,
                formKey: nameFormKey,
                myOwnKey: nameMyOwnKey,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
              ),
              EnterYourPassword(
                validator: (value) {
                  if (passwordController.text.isEmpty) {
                    passwordMyOwnKey = false;
                    return 'Field should not be null';
                  } else if (!RegExp('[A-Z]')
                      .hasMatch(passwordController.text)) {
                    passwordMyOwnKey = false;
                    return 'Password must contain Uppercase alphabets';
                  } else if (!RegExp('[a-z]')
                      .hasMatch(passwordController.text)) {
                    passwordMyOwnKey = false;
                    return 'Password must contain Lowercase alphabets';
                  } else if (!RegExp('[\\s]')
                      .hasMatch(passwordController.text)) {
                    passwordMyOwnKey = false;
                    return 'Password must contain spaces';
                  } else if (value!.length <= 10) {
                    passwordMyOwnKey = false;
                    return 'Password must be greater than 7 words';
                  } else if (!RegExp('[!_<;@#%>?/~`,")]')
                      .hasMatch(passwordController.text)) {
                    passwordMyOwnKey = false;
                    return 'Add Special charcters (e.g: !_<;@#%>?/~`,")))';
                  } else {
                    passwordMyOwnKey = true;
                    return null;
                  }
                },
                myOwnKey: passwordMyOwnKey,
                controller: passwordController,
                focusNode: passwordFocusNode,
                formKey: passwordFormKey,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
                },
              ),
              EnterYourConfirmPassword(
                  validator: (value) {
                    if (confirmPasswordController.text.isEmpty) {
                      confirmPasswordMyOwnKey = false;
                      return 'Field should not be null';
                    } else if (confirmPasswordController.text !=
                        passwordController.text) {
                      confirmPasswordMyOwnKey = false;
                      return 'Does not match with Create password';
                    } else {
                      confirmPasswordMyOwnKey = true;
                      return null;
                    }
                  },
                  myOwnKey: confirmPasswordMyOwnKey,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(buttonFocusNode);
                  },
                  catchingPassController: passwordController,
                  controller: confirmPasswordController,
                  focusNode: confirmPasswordFocusNode,
                  formKey: confirmPasswordKey),
              Flexible(
                child: ElevatedButton(
                    focusNode: buttonFocusNode,
                    onPressed: buttonSaveAction,
                    child: const FittedBox(child: Text('Save'))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
