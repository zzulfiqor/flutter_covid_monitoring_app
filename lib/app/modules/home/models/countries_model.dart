// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromJson(jsonString);

import 'dart:convert';

CountriesModel countriesModelFromJson(String str) => CountriesModel.fromJson(json.decode(str));

String countriesModelToJson(CountriesModel data) => json.encode(data.toJson());

class CountriesModel {
    CountriesModel({
        this.countries,
    });

    List<Country> countries;

    factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    };
}

class Country {
    Country({
        this.name,
        this.iso2,
        this.iso3,
    });

    String name;
    String iso2;
    String iso3;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        iso2: json["iso2"] == null ? null : json["iso2"],
        iso3: json["iso3"] == null ? null : json["iso3"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso2": iso2 == null ? null : iso2,
        "iso3": iso3 == null ? null : iso3,
    };
}
