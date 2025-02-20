// To parse this JSON data, do
//
//     final productlistingres = productlistingresFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'Productlistingres.g.dart';

List<Productlistingres> productlistingresFromJson(String str) => List<Productlistingres>.from(json.decode(str).map((x) => Productlistingres.fromJson(x)));

String productlistingresToJson(List<Productlistingres> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Productlistingres {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "variations")
    List<Variation>? variations;
    @JsonKey(name: "in_wishlist")
    bool? inWishlist;
    @JsonKey(name: "avg_rating")
    int? avgRating;
    @JsonKey(name: "images")
    List<String>? images;
    @JsonKey(name: "variation_exists")
    bool? variationExists;
    @JsonKey(name: "sale_price")
    int? salePrice;
    @JsonKey(name: "addons")
    List<Addon>? addons;
    @JsonKey(name: "available")
    bool? available;
    @JsonKey(name: "available_from")
    String? availableFrom;
    @JsonKey(name: "available_to")
    String? availableTo;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "description")
    String? description;
    @JsonKey(name: "caption")
    String? caption;
    @JsonKey(name: "featured_image")
    String? featuredImage;
    @JsonKey(name: "mrp")
    int? mrp;
    @JsonKey(name: "stock")
    int? stock;
    @JsonKey(name: "is_active")
    bool? isActive;
    @JsonKey(name: "discount")
    String? discount;
    @JsonKey(name: "created_date")
    String? createdDate;
    @JsonKey(name: "product_type")
    String? productType;
    @JsonKey(name: "showing_order")
    dynamic showingOrder;
    @JsonKey(name: "variation_name")
    String? variationName;
    @JsonKey(name: "category")
    int? category;
    @JsonKey(name: "tax_rate")
    int? taxRate;

    Productlistingres({
        this.id,
        this.variations,
        this.inWishlist,
        this.avgRating,
        this.images,
        this.variationExists,
        this.salePrice,
        this.addons,
        this.available,
        this.availableFrom,
        this.availableTo,
        this.name,
        this.description,
        this.caption,
        this.featuredImage,
        this.mrp,
        this.stock,
        this.isActive,
        this.discount,
        this.createdDate,
        this.productType,
        this.showingOrder,
        this.variationName,
        this.category,
        this.taxRate,
    });

    factory Productlistingres.fromJson(Map<String, dynamic> json) => _$ProductlistingresFromJson(json);

    Map<String, dynamic> toJson() => _$ProductlistingresToJson(this);
}

@JsonSerializable()
class Addon {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "price")
    int? price;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "description")
    String? description;
    @JsonKey(name: "featured_image")
    String? featuredImage;
    @JsonKey(name: "stock")
    int? stock;
    @JsonKey(name: "is_active")
    bool? isActive;
    @JsonKey(name: "tax_rate")
    int? taxRate;

    Addon({
        this.id,
        this.price,
        this.name,
        this.description,
        this.featuredImage,
        this.stock,
        this.isActive,
        this.taxRate,
    });

    factory Addon.fromJson(Map<String, dynamic> json) => _$AddonFromJson(json);

    Map<String, dynamic> toJson() => _$AddonToJson(this);
}

@JsonSerializable()
class Variation {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "sale_price")
    int? salePrice;
    @JsonKey(name: "variation_name")
    String? variationName;
    @JsonKey(name: "featured_image")
    String? featuredImage;
    @JsonKey(name: "stock")
    int? stock;
    @JsonKey(name: "created")
    String? created;
    @JsonKey(name: "show_status")
    bool? showStatus;
    @JsonKey(name: "showing_order")
    int? showingOrder;
    @JsonKey(name: "product")
    int? product;

    Variation({
        this.id,
        this.salePrice,
        this.variationName,
        this.featuredImage,
        this.stock,
        this.created,
        this.showStatus,
        this.showingOrder,
        this.product,
    });

    factory Variation.fromJson(Map<String, dynamic> json) => _$VariationFromJson(json);

    Map<String, dynamic> toJson() => _$VariationToJson(this);
}
