// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int placeId;
  String licence;
  String osmType;
  int osmId;
  String lat;
  String lon;
  String welcomeClass;
  String type;
  int placeRank;
  double importance;
  String addresstype;
  String name;
  String displayName;
  Address address;
  List<String> boundingbox;

  Welcome({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.welcomeClass,
    required this.type,
    required this.placeRank,
    required this.importance,
    required this.addresstype,
    required this.name,
    required this.displayName,
    required this.address,
    required this.boundingbox,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        placeId: json["place_id"],
        licence: json["licence"],
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        lat: json["lat"],
        lon: json["lon"],
        welcomeClass: json["class"],
        type: json["type"],
        placeRank: json["place_rank"],
        importance: json["importance"]?.toDouble(),
        addresstype: json["addresstype"],
        name: json["name"],
        displayName: json["display_name"],
        address: Address.fromJson(json["address"]),
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "licence": licence,
        "osm_type": osmType,
        "osm_id": osmId,
        "lat": lat,
        "lon": lon,
        "class": welcomeClass,
        "type": type,
        "place_rank": placeRank,
        "importance": importance,
        "addresstype": addresstype,
        "name": name,
        "display_name": displayName,
        "address": address.toJson(),
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
      };
}

class Address {
  String? hamlet;
  String? village;
  String? city;
  String? municipality;
  String? county;
  String? iso31662Lvl6;
  String? state;
  String? iso31662Lvl4;
  String? region;
  String? postcode;
  String country;
  String countryCode;
  String? bay;
  String? farm;
  String? peak;

  Address({
    this.hamlet,
    this.village,
    this.city,
    this.municipality,
    this.county,
    this.iso31662Lvl6,
    this.state,
    this.iso31662Lvl4,
    this.region,
    this.postcode,
    required this.country,
    required this.countryCode,
    this.bay,
    this.farm,
    this.peak,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        hamlet: json["hamlet"],
        village: json["village"],
        city: json["city"],
        municipality: json["municipality"],
        county: json["county"],
        iso31662Lvl6: json["ISO3166-2-lvl6"],
        state: json["state"],
        iso31662Lvl4: json["ISO3166-2-lvl4"],
        region: json["region"],
        postcode: json["postcode"],
        country: json["country"],
        countryCode: json["country_code"],
        bay: json["bay"],
        farm: json["farm"],
        peak: json["peak"],
      );

  Map<String, dynamic> toJson() => {
        "hamlet": hamlet,
        "village": village,
        "city": city,
        "municipality": municipality,
        "county": county,
        "ISO3166-2-lvl6": iso31662Lvl6,
        "state": state,
        "ISO3166-2-lvl4": iso31662Lvl4,
        "region": region,
        "postcode": postcode,
        "country": country,
        "country_code": countryCode,
        "bay": bay,
        "farm": farm,
        "peak": peak,
      };
}
