// To parse this JSON data, do
//
//     final hotelRestaurantItems = hotelRestaurantItemsFromJson(jsonString);

import 'dart:convert';

List<HotelRestaurantItems> hotelRestaurantItemsFromJson(String str) => List<HotelRestaurantItems>.from(json.decode(str).map((x) => HotelRestaurantItems.fromJson(x)));

String hotelRestaurantItemsToJson(List<HotelRestaurantItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelRestaurantItems {
  int categoryId;
  String categoryName;
  List<CategoryItem> categoryItems;

  HotelRestaurantItems({
    this.categoryId,
    this.categoryName,
    this.categoryItems,
  });

  factory HotelRestaurantItems.fromJson(Map<String, dynamic> json) => HotelRestaurantItems(
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
  List<Parametr> parametrs;
  int cookTime;
  int price;

  CategoryItem({
    this.itemId,
    this.itemName,
    this.imageUrl,
    this.description,
    this.parametrs,
    this.cookTime,
    this.price,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
    itemId: json["item_id"],
    itemName: json["item_name"],
    imageUrl: json["image_url"],
    description: json["description"] == null ? null : json["description"],
    parametrs: json["parametrs"] == null ? null : List<Parametr>.from(json["parametrs"].map((x) => Parametr.fromJson(x))),
    cookTime: json["cook_time"] == null ? null : json["cook_time"],
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "image_url": imageUrl,
    "description": description == null ? null : description,
    "parametrs": parametrs == null ? null : List<dynamic>.from(parametrs.map((x) => x.toJson())),
    "cook_time": cookTime == null ? null : cookTime,
    "price": price == null ? null : price,
  };
}

class Parametr {
  int parametrId;
  String parametrName;
  List<String> parametrsItems;

  Parametr({
    this.parametrId,
    this.parametrName,
    this.parametrsItems,
  });

  factory Parametr.fromJson(Map<String, dynamic> json) => Parametr(
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
