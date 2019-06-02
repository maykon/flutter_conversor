import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const _url = "https://api.hgbrasil.com/finance?format=json&key=6cce7b8e";

Future<Map> getData() async {
  var response = await http.get(_url);
  return json.decode(response.body);
}
