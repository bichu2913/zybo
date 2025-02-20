// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginres _$LoginresFromJson(Map<String, dynamic> json) => Loginres(
      otp: json['otp'] as String?,
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
      user: json['user'] as bool?,
    );

Map<String, dynamic> _$LoginresToJson(Loginres instance) => <String, dynamic>{
      'otp': instance.otp,
      'token': instance.token,
      'user': instance.user,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      access: json['access'] as String?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'access': instance.access,
    };
