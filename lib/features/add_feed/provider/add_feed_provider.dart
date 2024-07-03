import 'dart:io';

import 'package:flutter/material.dart';

import '../data/repository/add_feed_repository.dart';

class AddFeedProvider extends ChangeNotifier {
  AddFeedRepository addFeedRepository = AddFeedRepository();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void uploadFeed({
    required BuildContext context,
    required File video,
    required File image,
    required String description,
    required List<int> categoryList,
  }) async {
    _isLoading = true;
    notifyListeners();

    bool response = await addFeedRepository.uploadFeed(
        video: video,
        image: image,
        description: description,
        categoryList: categoryList);

    _isLoading = false;
    notifyListeners();

    if (response) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to upload!')),
      );
    }
  }
}
