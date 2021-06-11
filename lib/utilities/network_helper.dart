import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:http/http.dart';

class NetworkHelper {
  final String _url;
  NetworkHelper({url}) : _url = url;

  Future getData() async {
    Response response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw ("error when try to fetching data");
    }
  }
}
