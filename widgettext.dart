import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  String? hint;
  String? lable;
  TextEditingController controller = TextEditingController();
  MyTextFieldWidget(
      {required this.controller, required this.hint, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: hint,
          labelText: lable,
        ),
      ),
    );
  }
}
