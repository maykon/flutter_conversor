import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Erro ao carregar os dados :(",
        style: TextStyle(color: Colors.red, fontSize: 25.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
