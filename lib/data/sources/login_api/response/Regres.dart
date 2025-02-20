// To parse this JSON data, do
//
//     final regres = regresFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'Regres.g.dart';

Regres regresFromJson(String str) => Regres.fromJson(json.decode(str));

String regresToJson(Regres data) => json.encode(data.toJson());

@JsonSerializable()
class Regres {
    @JsonKey(name: "token")
    Token? token;
    @JsonKey(name: "user_id")
    String? userId;
    @JsonKey(name: "message")
    String? message;

    Regres({
        this.token,
        this.userId,
        this.message,
    });

    factory Regres.fromJson(Map<String, dynamic> json) => _$RegresFromJson(json);

    Map<String, dynamic> toJson() => _$RegresToJson(this);
}

@JsonSerializable()
class Token {
    @JsonKey(name: "access")
    String? access;

    Token({
        this.access,
    });

    factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

    Map<String, dynamic> toJson() => _$TokenToJson(this);
}
