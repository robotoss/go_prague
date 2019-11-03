// To parse this JSON data, do
//
//     final cityRestaurantItems = cityRestaurantItemsFromJson(jsonString);

import 'dart:convert';

List<CityRestaurantItems> cityRestaurantItemsFromJson(String str) => List<CityRestaurantItems>.from(json.decode(str).map((x) => CityRestaurantItems.fromJson(x)));

String cityRestaurantItemsToJson(List<CityRestaurantItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityRestaurantItems {
  int restaurantId;
  String restaurantName;
  String restaurantArticle;
  String restaurantType;
  String restaurantImage;
  String restaurantDistance;
  List<CityRestaurantItem> cityRestaurantItems;

  CityRestaurantItems({
    this.restaurantId,
    this.restaurantName,
    this.restaurantArticle,
    this.restaurantType,
    this.restaurantImage,
    this.restaurantDistance,
    this.cityRestaurantItems,
  });

  factory CityRestaurantItems.fromJson(Map<String, dynamic> json) => CityRestaurantItems(
    restaurantId: json["restaurant_id"],
    restaurantName: json["restaurant_name"],
    restaurantArticle: json["restaurant_article"],
    restaurantType: json["restaurant_type"],
    restaurantImage: json["restaurant_image"],
    restaurantDistance: json["restaurant_distance"],
    cityRestaurantItems: List<CityRestaurantItem>.from(json["resturant_items"].map((x) => CityRestaurantItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurant_id": restaurantId,
    "restaurant_name": restaurantName,
    "restaurant_article": restaurantArticle,
    "restaurant_type": restaurantType,
    "restaurant_image": restaurantImage,
    "restaurant_distance": restaurantDistance,
    "resturant_items": List<dynamic>.from(cityRestaurantItems.map((x) => x.toJson())),
  };
}

class CityRestaurantItem {
  int categoryId;
  String categoryName;
  List<CategoryItem> categoryItems;

  CityRestaurantItem({
    this.categoryId,
    this.categoryName,
    this.categoryItems,
  });

  factory CityRestaurantItem.fromJson(Map<String, dynamic> json) => CityRestaurantItem(
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
    description: json["description"],
    parametrs: List<Parametr>.from(json["parametrs"].map((x) => Parametr.fromJson(x))),
    cookTime: json["cook_time"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "image_url": imageUrl,
    "description": description,
    "parametrs": List<dynamic>.from(parametrs.map((x) => x.toJson())),
    "cook_time": cookTime,
    "price": price,
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
