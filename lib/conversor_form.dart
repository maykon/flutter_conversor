import 'package:flutter/material.dart';
import 'money_input.dart';

class ConversorForm extends StatefulWidget {
  final Map<dynamic, dynamic> data;

  ConversorForm({Key key, @required this.data}) : super(key: key);

  @override
  _ConversorFormState createState() => _ConversorFormState();
}

class _ConversorFormState extends State<ConversorForm> {
  final realController = TextEditingController();
  final dollarController = TextEditingController();
  final euroController = TextEditingController();

  double get dolar {
    return widget.data["results"]["currencies"]["USD"]["buy"];
  }

  double get euro {
    return widget.data["results"]["currencies"]["EUR"]["buy"];
  }

  void _clearAll() {
    realController.clear();
    dollarController.clear();
    euroController.clear();
  }

  bool _clearIfIsEmpty(String value) {
    if (value.isEmpty) {
      _clearAll();
      return true;
    }
    return false;
  }

  void _realChanged(String value) {
    if (_clearIfIsEmpty(value)) return;
    double real = double.parse(value);
    dollarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String value) {
    if (_clearIfIsEmpty(value)) return;
    double dolar = double.parse(value);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String value) {
    if (_clearIfIsEmpty(value)) return;
    double euro = double.parse(value);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dollarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.monetization_on,
              size: 150.0,
              color: Colors.amber,
            ),
            MoneyInput(
              label: "Reais",
              prefix: "R\$",
              controller: realController,
              onChanged: _realChanged,
            ),
            Divider(),
            MoneyInput(
              label: "Dólares",
              prefix: "US\$",
              controller: dollarController,
              onChanged: _dolarChanged,
            ),
            Divider(),
            MoneyInput(
              label: "Euros",
              prefix: "€",
              controller: euroController,
              onChanged: _euroChanged,
            ),
          ],
        ),
      ),
    );
  }
}
