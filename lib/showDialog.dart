import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void myShowDialog({required BuildContext context, required var fieldInput}) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 50,
              color: Colors.red,
            ),
            Text(
              'Error',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: FittedBox(
                child: Text(
                  '$fieldInput',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            )
          ],
        ),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 147, 147, 147))),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ))
        ],
      );
    },
  );
}

void submittedDialog({
  required BuildContext context,
}) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
          title: Icon(
            Icons.done,
            color: Colors.green,
            size: 50,
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Submitted',
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ],
          ));
    },
  );
}

void showDialogErrorOnly({required BuildContext context}) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Icon(
          Icons.error,
          size: 50,
          color: Colors.red,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Field contains error')],
        ),
      );
    },
  );
}
