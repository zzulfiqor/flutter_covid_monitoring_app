import 'package:covid/app/modules/detail_page/models/countries_by_iso3.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  var iso2 = Get.arguments[1] ?? "Data not found";
  var countryName = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blueGrey,
            ),
            onPressed: () => Get.back()),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: SizedBox(
            width: Get.width * 0.2,
            child: Image.asset('lib/res/img/app_logo.png')),
      ),
      body: (iso2 == 'Data not found')
          ? Center(
              child: Text(
                'Data Not Found',
                style: TextStyle(fontSize: 20),
              ),
            )
          : FutureBuilder<CountriesByIso3Model>(
              future: controller.fetchDetailData(iso2),
              builder: (context, snapshot) {
                var _data = snapshot.data;
                if (snapshot.hasData) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        height: Get.height * 0.2,
                        width: Get.width,
                        child: Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  color: Colors.blueGrey.withOpacity(.1),
                                  alignment: Alignment.centerLeft,
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 3,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.network(
                                          "https://www.countryflags.io/$iso2/shiny/48.png"),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(countryName),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      _dataContainer(
                                          "Confirmed",
                                          _data.confirmed.value,
                                          Colors.red[300].withOpacity(.7)),
                                      _dataContainer(
                                          "Recovered",
                                          _data.recovered.value,
                                          Colors.greenAccent[200]
                                              .withOpacity(.7)),
                                      _dataContainer(
                                          "Deaths",
                                          _data.deaths.value,
                                          Colors.black.withOpacity(.3)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
    );
  }

  Widget _dataContainer(String title, int value, Color color) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: color,
          width: Get.width * 0.25,
          height: Get.height * 0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(.6)),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                value.toString(),
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      );
}
