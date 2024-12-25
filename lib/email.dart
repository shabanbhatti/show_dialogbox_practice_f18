import 'package:flutter/material.dart';

class EnterYourEmail extends StatefulWidget {
  EnterYourEmail({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.formKey,
    required this.onFieldSubmitted,
    required this.myOwnKey,
    required this.validator
  });
  var controller;
  var focusNode;
  var formKey;
  var myOwnKey;
  String? Function(String?)? validator;

  Function(String)? onFieldSubmitted;

  @override
  State<EnterYourEmail> createState() => _EnterYourEmailState();
}

class _EnterYourEmailState extends State<EnterYourEmail> {
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
    return Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: SizedBox(
          width: mqSize.width * 0.85,
          child: TextFormField(
            onFieldSubmitted: widget.onFieldSubmitted,
            focusNode: widget.focusNode,
            controller: widget.controller,
            validator:widget.validator,
            // (value) {
            //   if (widget.controller.text.isEmpty) {
            //     return 'Field should not be null';
            //   } else if (!RegExp(emailContext)
            //       .hasMatch(widget.controller.text)) {
            //     return 'Invalid email form';
            //   } else {

            //     return null;
            //   }
            // },
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
                label: const FittedBox(
                  child: Text('Enter your email'),
                ),
                prefixIcon: const Icon(Icons.mail),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.controller.clear();
                      });
                    },
                    icon: const Icon(Icons.clear)),
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
