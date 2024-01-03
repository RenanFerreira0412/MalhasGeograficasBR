import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final String label;
  final String hint;
  final List<DropdownMenuItem<T>> items;
  final T value;
  final void Function(T?) onChanged;
  final bool validate;

  const CustomDropdownButton(
      {super.key,
      required this.label,
      required this.hint,
      required this.items,
      required this.value,
      required this.onChanged,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      items: items,
      value: value,
      onChanged: onChanged,
      validator: validate
          ? (value) {
              if (value == null || value == '') {
                return 'Please enter some text';
              }
              return null;
            }
          : null,
    );
  }
}
