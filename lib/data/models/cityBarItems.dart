// To parse this JSON data, do
//
//     final cityBarItems = cityBarItemsFromJson(jsonString);

import 'dart:convert';

List<CityBarItems> cityBarItemsFromJson(String str) => List<CityBarItems>.from(json.decode(str).map((x) => CityBarItems.fromJson(x)));

String cityBarItemsToJson(List<CityBarItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityBarItems {
  int barId;
  String barName;
  String barArticle;
  String barType;
  String barImage;
  String restaurantDistance;
  List<CityBarItem> cityBarItems;

  CityBarItems({
    this.barId,
    this.barName,
    this.barArticle,
    this.barType,
    this.barImage,
    this.restaurantDistance,
    this.cityBarItems,
  });

  factory CityBarItems.fromJson(Map<String, dynamic> json) => CityBarItems(
    barId: json["bar_id"],
    barName: json["bar_name"],
    barArticle: json["bar_article"],
    barType: json["bar_type"],
    barImage: json["bar_image"],
    restaurantDistance: json["restaurant_distance"],
    cityBarItems: List<CityBarItem>.from(json["resturant_items"].map((x) => CityBarItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bar_id": barId,
    "bar_name": barName,
    "bar_article": barArticle,
    "bar_type": barType,
    "bar_image": barImage,
    "restaurant_distance": restaurantDistance,
    "resturant_items": List<dynamic>.from(cityBarItems.map((x) => x.toJson())),
  };
}

class CityBarItem {
  int categoryId;
  String categoryName;
  List<CategoryItem> categoryItems;

  CityBarItem({
    this.categoryId,
    this.categoryName,
    this.categoryItems,
  });

  factory CityBarItem.fromJson(Map<String, dynamic> json) => CityBarItem(
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
