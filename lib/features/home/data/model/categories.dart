import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories.freezed.dart';
part 'categories.g.dart';

@freezed
class Categories with _$Categories {
  const factory Categories({
    required List<Category> categories,
    required bool status,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String title,
    required String image,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
