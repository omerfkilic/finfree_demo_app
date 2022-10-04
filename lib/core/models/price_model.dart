// To parse this JSON data, do
//
//     final priceModel = priceModelFromJson(jsonString);

import 'dart:convert';

PriceModel priceModelFromJson(String str) =>
    PriceModel.fromJson(json.decode(str));

String priceModelToJson(PriceModel data) => json.encode(data.toJson());

class PriceModel {
  PriceModel({
    required this.priceEntryof1G,
    required this.priceEntryof1H,
    required this.priceEntryof1A,
    required this.priceEntryof3A,
    required this.priceEntryof1Y,
    required this.priceEntryof5Y,
    required this.symbol,
  });

  List<PriceEntry>? priceEntryof1G;
  List<PriceEntry>? priceEntryof1H;
  List<PriceEntry>? priceEntryof1A;
  List<PriceEntry>? priceEntryof3A;
  List<PriceEntry>? priceEntryof1Y;
  List<PriceEntry>? priceEntryof5Y;
  String? symbol;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        priceEntryof1G: json["1G"] == null
            ? null
            : List<PriceEntry>.from(
                json["1G"].map((x) => PriceEntry.fromJson(x))),
        priceEntryof1H: json["1H"] == null
            ? null
            : List<PriceEntry>.from(
                json["1H"].map((x) => PriceEntry.fromJson(x))),
        priceEntryof1A: json["1A"] == null
            ? null
            : List<PriceEntry>.from(
                json["1A"].map((x) => PriceEntry.fromJson(x))),
        priceEntryof3A: json["3A"] == null
            ? null
            : List<PriceEntry>.from(
                json["3A"].map((x) => PriceEntry.fromJson(x))),
        priceEntryof1Y: json["1Y"] == null
            ? null
            : List<PriceEntry>.from(
                json["1Y"].map((x) => PriceEntry.fromJson(x))),
        priceEntryof5Y: json["5Y"] == null
            ? null
            : List<PriceEntry>.from(
                json["5Y"].map((x) => PriceEntry.fromJson(x))),
        symbol: json["symbol"] == null ? null : json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "1G": priceEntryof1G == null
            ? null
            : List<dynamic>.from(priceEntryof1G!.map((x) => x.toJson())),
        "1H": priceEntryof1H == null
            ? null
            : List<dynamic>.from(priceEntryof1H!.map((x) => x.toJson())),
        "1A": priceEntryof1A == null
            ? null
            : List<dynamic>.from(priceEntryof1A!.map((x) => x.toJson())),
        "3A": priceEntryof3A == null
            ? null
            : List<dynamic>.from(priceEntryof3A!.map((x) => x.toJson())),
        "1Y": priceEntryof1Y == null
            ? null
            : List<dynamic>.from(priceEntryof1Y!.map((x) => x.toJson())),
        "5Y": priceEntryof5Y == null
            ? null
            : List<dynamic>.from(priceEntryof5Y!.map((x) => x.toJson())),
        "symbol": symbol == null ? null : symbol,
      };
}

class PriceEntry {
  PriceEntry({
    required this.d,
    required this.c,
  });

  int d;
  double? c;

  factory PriceEntry.fromJson(Map<String, dynamic> json) => PriceEntry(
        d: json["d"] == null ? null : json["d"],
        c: json["c"] == null ? null : json["c"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "d": d == null ? null : d,
        "c": c == null ? null : c,
      };
}
