// To parse this JSON data, do
//
//     final regreq = regreqFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'Regreq.g.dart';

Regreq regreqFromJson(String str) => Regreq.fromJson(json.decode(str));

String regreqToJson(Regreq data) => json.encode(data.toJson());

@JsonSerializable()
class Regreq {
    @JsonKey(name: "first_name")
    String? firstName;
    @JsonKey(name: "phone_number")
    String? phoneNumber;

    Regreq({
        this.firstName,
        this.phoneNumber,
    });

    factory Regreq.fromJson(Map<String, dynamic> json) => _$RegreqFromJson(json);

    Map<String, dynamic> toJson() => _$RegreqToJson(this);
}

