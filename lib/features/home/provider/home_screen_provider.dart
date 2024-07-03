import 'package:flutter/material.dart';
import 'package:noviindus_task2/features/home/data/repository/home_screen_repository.dart';
import '../data/model/categories.dart';
import '../data/model/feed_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  HomeScreenRepository homeScreenRepository = HomeScreenRepository();
  List<Category>? _list;
  List<Result>? _feedList;
  bool _isLoading = false;
  String _errorMessage = '';

  List<Category>? get list => _list;
  List<Result>? get feedList => _feedList;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  HomeScreenProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    _setLoading(true);
    await Future.wait([fetchCategories(), fetchFeed()]);
    _setLoading(false);
  }

  Future<void> fetchCategories() async {
    try {
      var categories = await homeScreenRepository.fetchCategories();
      if (categories != null) {
        _list = categories;
      } else {
        _setError('Unable to fetch Categories');
      }
    } catch (e) {
      _setError('Error fetching Categories: $e');
    }
  }

  Future<void> fetchFeed() async {
    try {
      var feed = await homeScreenRepository.fetchFeed();
      if (feed != null) {
        _feedList = feed;
      } else {
        _setError('Unable to fetch Feed');
      }
    } catch (e) {
      _setError('Error fetching Feed: $e');
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }
}
