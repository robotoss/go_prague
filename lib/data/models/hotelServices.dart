// To parse this JSON data, do
//
//     final hotelServices = hotelServicesFromJson(jsonString);

import 'dart:convert';

List<HotelServices> hotelServicesFromJson(String str) => List<HotelServices>.from(json.decode(str).map((x) => HotelServices.fromJson(x)));

String hotelServicesToJson(List<HotelServices> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelServices {
  int categoryId;
  String categoryName;
  List<HotelServicesCategoryItem> categoryItems;

  HotelServices({
    this.categoryId,
    this.categoryName,
    this.categoryItems,
  });

  factory HotelServices.fromJson(Map<String, dynamic> json) => HotelServices(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryItems: List<HotelServicesCategoryItem>.from(json["category_items"].map((x) => HotelServicesCategoryItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_items": List<dynamic>.from(categoryItems.map((x) => x.toJson())),
  };
}

class HotelServicesCategoryItem {
  int itemId;
  String itemName;
  String imageUrl;
  String description;
  List<HotelServicesParametr> parametrs;
  dynamic price;
  String duration;
  int freeSpace;

  HotelServicesCategoryItem({
    this.itemId,
    this.itemName,
    this.imageUrl,
    this.description,
    this.parametrs,
    this.price,
    this.duration,
    this.freeSpace,
  });

  factory HotelServicesCategoryItem.fromJson(Map<String, dynamic> json) => HotelServicesCategoryItem(
    itemId: json["item_id"],
    itemName: json["item_name"],
    imageUrl: json["image_url"],
    description: json["description"],
    parametrs: List<HotelServicesParametr>.from(json["parametrs"].map((x) => HotelServicesParametr.fromJson(x))),
    price: json["price"],
    duration: json["duration"] == null ? null : json["duration"],
    freeSpace: json["FreeSpace"] == null ? null : json["FreeSpace"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "image_url": imageUrl,
    "description": description,
    "parametrs": List<dynamic>.from(parametrs.map((x) => x.toJson())),
    "price": price,
    "duration": duration == null ? null : duration,
    "FreeSpace": freeSpace == null ? null : freeSpace,
  };
}

class HotelServicesParametr {
  int parametrId;
  String parametrName;
  List<String> parametrsItems;

  HotelServicesParametr({
    this.parametrId,
    this.parametrName,
    this.parametrsItems,
  });

  factory HotelServicesParametr.fromJson(Map<String, dynamic> json) => HotelServicesParametr(
    parametrId: json["parametr_id"],
    parametrName: json["parametr_name"],
    parametrsItems: List<String>.from(json["parametrs_items"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "parametr_id": parametrId,
    "parametr_name": parametrName,
    "parametrs_items": List<dynamic>.from(parametrsItems.map((x) => x)),
  };
}
