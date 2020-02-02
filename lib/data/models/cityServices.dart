// To parse this JSON data, do
//
//     final cityServices = cityServicesFromJson(jsonString);

import 'dart:convert';

List<CityServices> cityServicesFromJson(String str) => List<CityServices>.from(json.decode(str).map((x) => CityServices.fromJson(x)));

String cityServicesToJson(List<CityServices> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityServices {
    int categoryId;
    String categoryName;
    List<CategoryItem> categoryItems;

    CityServices({
        this.categoryId,
        this.categoryName,
        this.categoryItems,
    });

    factory CityServices.fromJson(Map<String, dynamic> json) => CityServices(
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
    String duration;
    double price;
    String time;

    CategoryItem({
        this.itemId,
        this.itemName,
        this.imageUrl,
        this.description,
        this.duration,
        this.price,
        this.time,
    });

    factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        itemId: json["item_id"],
        itemName: json["item_name"],
        imageUrl: json["image_url"],
        description: json["description"],
        duration: json["duration"] == null ? null : json["duration"],
        price: json["price"].toDouble(),
        time: json["time"] == null ? null : json["time"],
    );

    Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "item_name": itemName,
        "image_url": imageUrl,
        "description": description,
        "duration": duration == null ? null : duration,
        "price": price,
        "time": time == null ? null : time,
    };
}
