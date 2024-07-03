// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      status: json['status'] as bool?,
      privilage: json['privilage'] as bool?,
      token: json['token'] == null
          ? null
          : TokenClass.fromJson(json['token'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'privilage': instance.privilage,
      'token': instance.token,
      'phone': instance.phone,
    };

_$TokenClassImpl _$$TokenClassImplFromJson(Map<String, dynamic> json) =>
    _$TokenClassImpl(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
    );

Map<String, dynamic> _$$TokenClassImplToJson(_$TokenClassImpl instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
    };
