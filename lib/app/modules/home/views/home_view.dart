import 'package:covid/app/modules/home/models/countries_model.dart';
import 'package:covid/app/modules/home/models/covid_worldwide_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: SizedBox(
              width: Get.width * 0.2,
              child: Image.asset('lib/res/img/app_logo.png')),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                // Header
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  margin: EdgeInsets.all(10),
                  height: Get.height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //
                      // Illustration
                      SizedBox(
                          width: Get.width * 0.3,
                          height: Get.height * 0.2,
                          child: Image.network(
                            'https://i.pinimg.com/originals/fa/7f/d1/fa7fd1c4cb1a50d9cb899f0878ac039b.png',
                            fit: BoxFit.contain,
                          )),
                      //
                      // Worldwide Data
                      Container(
                        padding: EdgeInsets.all(12),
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(8)),
                        width: Get.width * 0.5,
                        height: Get.height * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //
                            // title worldwide data
                            Text(
                              "Worldwide Data",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            //
                            // Container Of Data
                            FutureBuilder<CovidWorldwideModel>(
                                future: controller.fetchDataWorldwide(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      child: Column(
                                        children: [
                                          //
                                          // Row of COnfirmed Total
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Confirmed",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  "${snapshot.data.confirmed.value}"),
                                            ],
                                          ),
                                          //
                                          // Row of Death Total
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Death",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  "${snapshot.data.recovered.value}"),
                                            ],
                                          ),
                                          //
                                          // Row of Recovered Total
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Recovered",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text("19234923"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //
                // List of COuntries
                FutureBuilder<CountriesModel>(
                    future: controller.fetchCountries(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data.countries.length,
                              itemBuilder: (_, i) {
                                var dataCountry = snapshot.data.countries[i];
                                Widget _countryFlagImage() => (dataCountry
                                            .iso2 ==
                                        null)
                                    ? SizedBox(
                                        width: 48,
                                        child: Image.network(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRy9JeaAQ-w2SDN2zcEQIKCXcuYkwejyWoiw&usqp=CAU"),
                                      )
                                    : Image.network(
                                        "https://www.countryflags.io/${dataCountry.iso2}/shiny/48.png");
                                //
                                // List Tile of COuntries
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Get.toNamed('/detail-page', arguments: [
                                          dataCountry.name,
                                          dataCountry.iso2
                                        ]);
                                      },
                                      leading: _countryFlagImage(),
                                      title: Text(dataCountry.name),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.blueGrey.withOpacity(.2),
                                    ),
                                    
                                  ],
                                );
                              }),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
