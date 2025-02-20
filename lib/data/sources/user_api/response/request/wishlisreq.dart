// To parse this JSON data, do
//
//     final wishlisreq = wishlisreqFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'wishlisreq.g.dart';

Wishlisreq wishlisreqFromJson(String str) => Wishlisreq.fromJson(json.decode(str));

String wishlisreqToJson(Wishlisreq data) => json.encode(data.toJson());

@JsonSerializable()
class Wishlisreq {
    @JsonKey(name: "message")
    String? message;

    Wishlisreq({
        this.message,
    });

    factory Wishlisreq.fromJson(Map<String, dynamic> json) => _$WishlisreqFromJson(json);

    Map<String, dynamic> toJson() => _$WishlisreqToJson(this);
}
