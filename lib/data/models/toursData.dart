// To parse this JSON data, do
//
//     final toursData = toursDataFromJson(jsonString);

import 'dart:convert';

List<ToursData> toursDataFromJson(String str) => List<ToursData>.from(json.decode(str).map((x) => ToursData.fromJson(x)));

String toursDataToJson(List<ToursData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToursData {
  int categoryId;
  String categoryName;
  List<ItemTourData> items;

  ToursData({
    this.categoryId,
    this.categoryName,
    this.items,
  });

  factory ToursData.fromJson(Map<String, dynamic> json) => ToursData(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    items: List<ItemTourData>.from(json["items"].map((x) => ItemTourData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class ItemTourData {
  Language language;
  String name;
  bool mainScreen;
  Categ category;
  List<String> imgUrls;
  String article;
  String duration;
  int price;
  int freeSpace;
  Categ categiry;

  ItemTourData({
    this.language,
    this.name,
    this.mainScreen,
    this.category,
    this.imgUrls,
    this.article,
    this.duration,
    this.price,
    this.freeSpace,
    this.categiry,
  });

  factory ItemTourData.fromJson(Map<String, dynamic> json) => ItemTourData(
    language: languageValues.map[json["language"]],
    name: json["name"],
    mainScreen: json["mainScreen"],
    category: json["category"] == null ? null : categValues.map[json["category"]],
    imgUrls: List<String>.from(json["imgUrls"].map((x) => x)),
    article: json["article"],
    duration: json["duration"],
    price: json["price"],
    freeSpace: json["FreeSpace"],
    categiry: json["categiry"] == null ? null : categValues.map[json["categiry"]],
  );

  Map<String, dynamic> toJson() => {
    "language": languageValues.reverse[language],
    "name": name,
    "mainScreen": mainScreen,
    "category": category == null ? null : categValues.reverse[category],
    "imgUrls": List<dynamic>.from(imgUrls.map((x) => x)),
    "article": article,
    "duration": duration,
    "price": price,
    "FreeSpace": freeSpace,
    "categiry": categiry == null ? null : categValues.reverse[categiry],
  };
}

enum Categ { TOUR }

final categValues = EnumValues({
  "tour": Categ.TOUR
});

enum Language { EN }

final languageValues = EnumValues({
  "en": Language.EN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
