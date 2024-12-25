import 'package:flutter/material.dart';

class EnterYourPassword extends StatefulWidget {
  EnterYourPassword(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.formKey,
      required this.onFieldSubmitted,
      required this.myOwnKey,
      this.validator});
  var controller;
  var focusNode;
  var formKey;
  var myOwnKey;

  Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;

  @override
  State<EnterYourPassword> createState() => _EnterYourPassword();
}

class _EnterYourPassword extends State<EnterYourPassword> {
  var isObscure = true;
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: SizedBox(
          width: mqSize.width * 0.85,
          child: TextFormField(
            onFieldSubmitted: widget.onFieldSubmitted,
            focusNode: widget.focusNode,
            controller: widget.controller,
            obscureText: isObscure,
            validator: widget.validator,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
                label: const FittedBox(
                  child: Text('Create your password'),
                ),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: isObscure == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = false;
                          });
                        },
                        icon: const Icon(Icons.visibility))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = true;
                          });
                        },
                        icon: const Icon(Icons.visibility_off)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: (widget.controller.text.isNotEmpty)
                        ? const BorderSide(color: Colors.green, width: 2)
                        : const BorderSide(color: Colors.black))),
          ),
        ));
  }
}
