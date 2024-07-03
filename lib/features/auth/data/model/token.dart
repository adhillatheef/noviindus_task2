import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    bool? status,
    bool? privilage,
    TokenClass? token,
    String? phone,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}

@freezed
class TokenClass with _$TokenClass {
  const factory TokenClass({
    String? refresh,
    String? access,
  }) = _TokenClass;

  factory TokenClass.fromJson(Map<String, dynamic> json) => _$TokenClassFromJson(json);
}
