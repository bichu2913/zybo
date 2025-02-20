// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_profile.g.dart';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

@JsonSerializable()
class UserProfile {
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "phone_number")
    String? phoneNumber;

    UserProfile({
        this.name,
        this.phoneNumber,
    });

    factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

    Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
