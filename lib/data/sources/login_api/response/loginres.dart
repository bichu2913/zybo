// To parse this JSON data, do
//
//     final loginres = loginresFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'loginres.g.dart';

Loginres loginresFromJson(String str) => Loginres.fromJson(json.decode(str));

String loginresToJson(Loginres data) => json.encode(data.toJson());

@JsonSerializable()
class Loginres {
    @JsonKey(name: "otp")
    String? otp;
    @JsonKey(name: "token")
    Token? token;
    @JsonKey(name: "user")
    bool? user;

    Loginres({
        this.otp,
        this.token,
        this.user,
    });

    factory Loginres.fromJson(Map<String, dynamic> json) => _$LoginresFromJson(json);

    Map<String, dynamic> toJson() => _$LoginresToJson(this);
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

