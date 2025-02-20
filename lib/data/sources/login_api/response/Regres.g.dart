// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Regres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Regres _$RegresFromJson(Map<String, dynamic> json) => Regres(
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
      userId: json['user_id'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RegresToJson(Regres instance) => <String, dynamic>{
      'token': instance.token,
      'user_id': instance.userId,
      'message': instance.message,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      access: json['access'] as String?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'access': instance.access,
    };
