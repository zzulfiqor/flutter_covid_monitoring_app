import 'dart:convert';

import 'package:covid/app/modules/home/models/countries_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CountriesProvider {
  final client = http.Client();

  Future<CountriesModel> getCountries()async{
     var res = await client.get(Uri.parse('https://covid19.mathdro.id/api/countries'));
    try {
      var jsonString = res.body;
      var jsonMap = json.decode(jsonString);
      var data = CountriesModel.fromJson(jsonMap);
      return data;
    } catch (err) {
      print("Err Details : ${err}");
    }
  }
}
