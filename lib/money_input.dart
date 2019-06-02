import 'package:flutter/material.dart';

class MoneyInput extends StatelessWidget {
  final String label;
  final String prefix;
  final TextEditingController controller;
  final Function onChanged;

  const MoneyInput(
      {Key key,
      @required this.label,
      @required this.prefix,
      @required this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: "$prefix ",
      ),
      style: TextStyle(
        color: Colors.amber,
        fontSize: 25.0,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      controller: controller,
      onChanged: onChanged,
    );
  }
}
