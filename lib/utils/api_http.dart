import 'dart:convert';

import 'package:exam/home/model/homemodel.dart';
import 'package:http/http.dart' as http;

class Api_http {
  Future<Homemodel?> getData() async {
    String apiLink =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=03b0ab6e43d74ffd9cf6ba360e67b03c";
    var response = await http.get(Uri.parse(apiLink));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      Homemodel h1 = Homemodel.fromJson(json);
      return h1;
    }
  }
}
