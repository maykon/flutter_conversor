import 'package:flutter/material.dart';

import 'package:conversor/api.dart';
import 'package:conversor/loading.dart';
import 'package:conversor/error.dart';
import 'conversor_form.dart';

class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  Widget _buildFuture(
      BuildContext context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Loading();
      default:
        if (snapshot.hasError) return Error();
        return ConversorForm(data: snapshot.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: _buildFuture,
      ),
    );
  }
}
