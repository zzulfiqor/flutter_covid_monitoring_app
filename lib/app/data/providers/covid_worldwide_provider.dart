import 'dart:convert';

import 'package:covid/app/modules/detail_page/models/countries_by_iso3.dart';
import 'package:covid/app/modules/home/models/covid_worldwide_model.dart';
import 'package:http/http.dart' as http;

class CovidWorldwideProvider {
  final client = http.Client();

  Future<CovidWorldwideModel> getDataCovidWorldwide() async {
    var res = await client.get(Uri.parse('https://covid19.mathdro.id/api'));
    try {
      var jsonString = res.body;
      var jsonMap = json.decode(jsonString);
      var data = CovidWorldwideModel.fromJson(jsonMap);
      return data;
    } catch (err) {
      print("Err Details : ${err}");
    }
  }

  Future<CountriesByIso3Model> getDetailDataCountry(String iso3) async {
    var res = await client.get(Uri.parse('https://covid19.mathdro.id/api/countries/$iso3'));
    try {
      var jsonString = res.body;
      var jsonMap = json.decode(jsonString);
      var data = CountriesByIso3Model.fromJson(jsonMap);
      return data;
    } catch (err) {
      print("Err Details : ${err}");
    }
  }


}
