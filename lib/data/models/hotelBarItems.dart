// To parse this JSON data, do
//
//     final hotelBartItems = hotelBartItemsFromJson(jsonString);

import 'dart:convert';

List<HotelBartItems> hotelBartItemsFromJson(String str) => List<HotelBartItems>.from(json.decode(str).map((x) => HotelBartItems.fromJson(x)));

String hotelBartItemsToJson(List<HotelBartItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelBartItems {
  int categoryId;
  String categoryName;
  List<CategoryItem> categoryItems;

  HotelBartItems({
    this.categoryId,
    this.categoryName,
    this.categoryItems,
  });

  factory HotelBartItems.fromJson(Map<String, dynamic> json) => HotelBartItems(
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
