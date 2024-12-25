import 'package:flutter/material.dart';

class EnterYourName extends StatefulWidget {
  EnterYourName(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.formKey,
      required this.onFieldSubmitted,
      required this.myOwnKey,
      required this.validator});
  var controller;
  var focusNode;
  var formKey;
  var myOwnKey;

  Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;

  @override
  State<EnterYourName> createState() => _EnterYourNameState();
}

class _EnterYourNameState extends State<EnterYourName> {
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
            validator: widget.validator,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
                label: const FittedBox(
                  child: Text('Enter your name'),
                ),
                prefixIcon: const Icon(Icons.person),
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
