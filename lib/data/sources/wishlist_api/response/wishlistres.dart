// To parse this JSON data, do
//
//     final wishlisres = wishlisresFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'wishlistres.g.dart';

Wishlisres wishlisresFromJson(String str) => Wishlisres.fromJson(json.decode(str));

String wishlisresToJson(Wishlisres data) => json.encode(data.toJson());

@JsonSerializable()
class Wishlisres {
    @JsonKey(name: "product_id")
    String? productId;

    Wishlisres({
        this.productId,
    });

    factory Wishlisres.fromJson(Map<String, dynamic> json) => _$WishlisresFromJson(json);

    Map<String, dynamic> toJson() => _$WishlisresToJson(this);
}
