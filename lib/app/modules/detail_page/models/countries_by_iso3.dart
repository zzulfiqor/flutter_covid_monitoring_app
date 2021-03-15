// To parse this JSON data, do
//
//     final countriesByIso3Model = countriesByIso3ModelFromJson(jsonString);

import 'dart:convert';

CountriesByIso3Model countriesByIso3ModelFromJson(String str) => CountriesByIso3Model.fromJson(json.decode(str));

String countriesByIso3ModelToJson(CountriesByIso3Model data) => json.encode(data.toJson());

class CountriesByIso3Model {
    CountriesByIso3Model({
        this.confirmed,
        this.recovered,
        this.deaths,
        this.lastUpdate,
    });

    Confirmed confirmed;
    Confirmed recovered;
    Confirmed deaths;
    DateTime lastUpdate;

    factory CountriesByIso3Model.fromJson(Map<String, dynamic> json) => CountriesByIso3Model(
        confirmed: Confirmed.fromJson(json["confirmed"]),
        recovered: Confirmed.fromJson(json["recovered"]),
        deaths: Confirmed.fromJson(json["deaths"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "confirmed": confirmed.toJson(),
        "recovered": recovered.toJson(),
        "deaths": deaths.toJson(),
        "lastUpdate": lastUpdate.toIso8601String(),
    };
}

class Confirmed {
    Confirmed({
        this.value,
        this.detail,
    });

    int value;
    String detail;

    factory Confirmed.fromJson(Map<String, dynamic> json) => Confirmed(
        value: json["value"],
        detail: json["detail"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "detail": detail,
    };
}
