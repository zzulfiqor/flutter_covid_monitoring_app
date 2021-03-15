import 'package:covid/app/data/providers/countries_provider.dart';
import 'package:covid/app/data/providers/covid_worldwide_provider.dart';
import 'package:covid/app/modules/home/models/countries_model.dart';
import 'package:covid/app/modules/home/models/covid_worldwide_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<CovidWorldwideModel> fetchDataWorldwide() =>
      CovidWorldwideProvider().getDataCovidWorldwide();

  Future<CountriesModel> fetchCountries() => CountriesProvider().getCountries();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
