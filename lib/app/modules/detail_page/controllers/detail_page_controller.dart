import 'package:covid/app/data/providers/covid_worldwide_provider.dart';
import 'package:covid/app/modules/detail_page/models/countries_by_iso3.dart';
import 'package:get/get.dart';

class DetailPageController extends GetxController {
  Future<CountriesByIso3Model> fetchDetailData(String iso3) => CovidWorldwideProvider().getDetailDataCountry(iso3);

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
