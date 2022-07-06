import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String label;
  VoidCallback onTap;
  Color? backgroundColor;
  // double size;

  Button(
      {Key? key,
      required this.label,
      required this.onTap,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.black)))),
          child: Text(
            label,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          )),
    );
  }
}
