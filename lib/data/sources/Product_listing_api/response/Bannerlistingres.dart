// To parse this JSON data, do
//
//     final bannerlistingres = bannerlistingresFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'Bannerlistingres.g.dart';

List<Bannerlistingres> bannerlistingresFromJson(String str) => List<Bannerlistingres>.from(json.decode(str).map((x) => Bannerlistingres.fromJson(x)));

String bannerlistingresToJson(List<Bannerlistingres> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Bannerlistingres {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "product")
    Product? product;
    @JsonKey(name: "category")
    Category? category;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "image")
    String? image;
    @JsonKey(name: "showing_order")
    int? showingOrder;
    @JsonKey(name: "is_active")
    bool? isActive;

    Bannerlistingres({
        this.id,
        this.product,
        this.category,
        this.name,
        this.image,
        this.showingOrder,
        this.isActive,
    });

    factory Bannerlistingres.fromJson(Map<String, dynamic> json) => _$BannerlistingresFromJson(json);

    Map<String, dynamic> toJson() => _$BannerlistingresToJson(this);
}

@JsonSerializable()
class Category {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "image")
    String? image;
    @JsonKey(name: "is_active")
    bool? isActive;
    @JsonKey(name: "showing_order")
    int? showingOrder;
    @JsonKey(name: "slug")
    String? slug;
    @JsonKey(name: "products")
    List<Product>? products;
    @JsonKey(name: "hexcode_1")
    dynamic hexcode1;
    @JsonKey(name: "hexcode_2")
    dynamic hexcode2;

    Category({
        this.id,
        this.name,
        this.image,
        this.isActive,
        this.showingOrder,
        this.slug,
        this.products,
        this.hexcode1,
        this.hexcode2,
    });

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Product {
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

    Product({
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

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

    Map<String, dynamic> toJson() => _$ProductToJson(this);
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
