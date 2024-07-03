// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  bool? get status => throw _privateConstructorUsedError;
  bool? get privilage => throw _privateConstructorUsedError;
  TokenClass? get token => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call({bool? status, bool? privilage, TokenClass? token, String? phone});

  $TokenClassCopyWith<$Res>? get token;
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? privilage = freezed,
    Object? token = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      privilage: freezed == privilage
          ? _value.privilage
          : privilage // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenClass?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenClassCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $TokenClassCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TokenImplCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$TokenImplCopyWith(
          _$TokenImpl value, $Res Function(_$TokenImpl) then) =
      __$$TokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, bool? privilage, TokenClass? token, String? phone});

  @override
  $TokenClassCopyWith<$Res>? get token;
}

/// @nodoc
class __$$TokenImplCopyWithImpl<$Res>
    extends _$TokenCopyWithImpl<$Res, _$TokenImpl>
    implements _$$TokenImplCopyWith<$Res> {
  __$$TokenImplCopyWithImpl(
      _$TokenImpl _value, $Res Function(_$TokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? privilage = freezed,
    Object? token = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$TokenImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      privilage: freezed == privilage
          ? _value.privilage
          : privilage // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenClass?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenImpl implements _Token {
  const _$TokenImpl({this.status, this.privilage, this.token, this.phone});

  factory _$TokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenImplFromJson(json);

  @override
  final bool? status;
  @override
  final bool? privilage;
  @override
  final TokenClass? token;
  @override
  final String? phone;

  @override
  String toString() {
    return 'Token(status: $status, privilage: $privilage, token: $token, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.privilage, privilage) ||
                other.privilage == privilage) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, privilage, token, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      __$$TokenImplCopyWithImpl<_$TokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenImplToJson(
      this,
    );
  }
}

abstract class _Token implements Token {
  const factory _Token(
      {final bool? status,
      final bool? privilage,
      final TokenClass? token,
      final String? phone}) = _$TokenImpl;

  factory _Token.fromJson(Map<String, dynamic> json) = _$TokenImpl.fromJson;

  @override
  bool? get status;
  @override
  bool? get privilage;
  @override
  TokenClass? get token;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenClass _$TokenClassFromJson(Map<String, dynamic> json) {
  return _TokenClass.fromJson(json);
}

/// @nodoc
mixin _$TokenClass {
  String? get refresh => throw _privateConstructorUsedError;
  String? get access => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenClassCopyWith<TokenClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenClassCopyWith<$Res> {
  factory $TokenClassCopyWith(
          TokenClass value, $Res Function(TokenClass) then) =
      _$TokenClassCopyWithImpl<$Res, TokenClass>;
  @useResult
  $Res call({String? refresh, String? access});
}

/// @nodoc
class _$TokenClassCopyWithImpl<$Res, $Val extends TokenClass>
    implements $TokenClassCopyWith<$Res> {
  _$TokenClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refresh = freezed,
    Object? access = freezed,
  }) {
    return _then(_value.copyWith(
      refresh: freezed == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String?,
      access: freezed == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenClassImplCopyWith<$Res>
    implements $TokenClassCopyWith<$Res> {
  factory _$$TokenClassImplCopyWith(
          _$TokenClassImpl value, $Res Function(_$TokenClassImpl) then) =
      __$$TokenClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? refresh, String? access});
}

/// @nodoc
class __$$TokenClassImplCopyWithImpl<$Res>
    extends _$TokenClassCopyWithImpl<$Res, _$TokenClassImpl>
    implements _$$TokenClassImplCopyWith<$Res> {
  __$$TokenClassImplCopyWithImpl(
      _$TokenClassImpl _value, $Res Function(_$TokenClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refresh = freezed,
    Object? access = freezed,
  }) {
    return _then(_$TokenClassImpl(
      refresh: freezed == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String?,
      access: freezed == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenClassImpl implements _TokenClass {
  const _$TokenClassImpl({this.refresh, this.access});

  factory _$TokenClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenClassImplFromJson(json);

  @override
  final String? refresh;
  @override
  final String? access;

  @override
  String toString() {
    return 'TokenClass(refresh: $refresh, access: $access)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenClassImpl &&
            (identical(other.refresh, refresh) || other.refresh == refresh) &&
            (identical(other.access, access) || other.access == access));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, refresh, access);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenClassImplCopyWith<_$TokenClassImpl> get copyWith =>
      __$$TokenClassImplCopyWithImpl<_$TokenClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenClassImplToJson(
      this,
    );
  }
}

abstract class _TokenClass implements TokenClass {
  const factory _TokenClass({final String? refresh, final String? access}) =
      _$TokenClassImpl;

  factory _TokenClass.fromJson(Map<String, dynamic> json) =
      _$TokenClassImpl.fromJson;

  @override
  String? get refresh;
  @override
  String? get access;
  @override
  @JsonKey(ignore: true)
  _$$TokenClassImplCopyWith<_$TokenClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
