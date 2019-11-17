// To parse this JSON data, do
//
//     final cityServices = cityServicesFromJson(jsonString);

import 'dart:convert';

List<CityServices> cityServicesFromJson(String str) => List<CityServices>.from(json.decode(str).map((x) => CityServices.fromJson(x)));

String cityServicesToJson(List<CityServices> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityServices {
  int placeId;
  String placeName;
  double placeDistance;
  String placeType;
  String placeDescription;
  String placeImage;
  List<PlaceItem> placeItems;

  CityServices({
    this.placeId,
    this.placeName,
    this.placeDistance,
    this.placeType,
    this.placeDescription,
    this.placeImage,
    this.placeItems,
  });

  factory CityServices.fromJson(Map<String, dynamic> json) => CityServices(
    placeId: json["place_id"],
    placeName: json["place_name"],
    placeDistance: json["place_distance"].toDouble(),
    placeType: json["place_type"],
    placeDescription: json["place_description"],
    placeImage: json["place_image"],
    placeItems: List<PlaceItem>.from(json["place_items"].map((x) => PlaceItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "place_id": placeId,
    "place_name": placeName,
    "place_distance": placeDistance,
    "place_type": placeType,
    "place_description": placeDescription,
    "place_image": placeImage,
    "place_items": List<dynamic>.from(placeItems.map((x) => x.toJson())),
  };
}

class PlaceItem {
  int categoryId;
  String categoryName;
  List<CategoryItem> categoryItems;

  PlaceItem({
    this.categoryId,
    this.categoryName,
    this.categoryItems,
  });

  factory PlaceItem.fromJson(Map<String, dynamic> json) => PlaceItem(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryItems: List<CategoryItem>.from(json["category_items"].map((x) => CategoryItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_items": List<dynamic>.from(categoryItems.map((x) => x.toJson())),
  };
}

class CategoryItem {
  int itemId;
  String itemName;
  String imageUrl;
  String description;
  int time;
  double volume;
  int price;

  CategoryItem({
    this.itemId,
    this.itemName,
    this.imageUrl,
    this.description,
    this.time,
    this.volume,
    this.price,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
    itemId: json["item_id"],
    itemName: json["item_name"],
    imageUrl: json["image_url"],
    description: json["description"],
    time: json["time"],
    volume: json["volume"].toDouble(),
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "image_url": imageUrl,
    "description": description,
    "time": time,
    "volume": volume,
    "price": price,
  };
}
