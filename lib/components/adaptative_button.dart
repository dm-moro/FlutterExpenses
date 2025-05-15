import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {

  final String label;
  final Function onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ? CupertinoButton(
        onPressed: () => onPressed,
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: 20),
        child: Text(label),
        )
      : ElevatedButton(
        onPressed: () => onPressed, 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          textStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white),
          ),
        ),
        child: Text(label),
      );
  }
}