// To parse this JSON data, do
//
//     final loginreq = loginreqFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'loginreq.g.dart';

Loginreq loginreqFromJson(String str) => Loginreq.fromJson(json.decode(str));

String loginreqToJson(Loginreq data) => json.encode(data.toJson());

@JsonSerializable()
class Loginreq {
    @JsonKey(name: "phone_number")
    String? phoneNumber;

    Loginreq({
        this.phoneNumber,
    });

    Loginreq copyWith({
        String? phoneNumber,
    }) => 
        Loginreq(
            phoneNumber: phoneNumber ?? this.phoneNumber,
        );

    factory Loginreq.fromJson(Map<String, dynamic> json) => _$LoginreqFromJson(json);

    Map<String, dynamic> toJson() => _$LoginreqToJson(this);
}
