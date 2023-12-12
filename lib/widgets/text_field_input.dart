import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPassword = false,
    required this.hintText,
    required this.keyboardType,
  });
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(
        context,
        color: Theme.of(context).dividerColor.withOpacity(0.5),
      ),
    );
    return TextField(
      style:  TextStyle(color: Theme.of(context).primaryColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:  TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.4)),
        border: inputBorder,
        focusedBorder: inputBorder.copyWith(borderSide: BorderSide(color: Theme.of(context).dividerColor, width: 2)),
        enabledBorder: inputBorder,
        fillColor: Theme.of(context).dialogBackgroundColor,
        filled: true,
        contentPadding: const EdgeInsets.all(9),
      ),
      keyboardType: keyboardType,
      obscureText: isPassword,
    );
  }
}
