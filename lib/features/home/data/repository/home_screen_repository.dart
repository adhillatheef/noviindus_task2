import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/categories.dart';
import '../model/feed_model.dart';

class HomeScreenRepository {
  Future<List<Category>?> fetchCategories() async {
    var headers = {
      'Cookie':
          'csrftoken=wKhakEW9eYBjXe3SIOVMjk3wnYbU2f4a; sessionid=7m7d7xg671nlubp6xr3cgphfbvgmzn0m'
    };
    var request = http.Request(
        'GET', Uri.parse('https://frijo.noviindus.in/api/category_list'));

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 202) {
        String responseBody = await response.stream.bytesToString();
        Categories categories = Categories.fromJson(json.decode(responseBody));
        return categories.categories;
      } else {
        print('Failed to fetch categories: ${response.reasonPhrase}');
        return null;
      }
    } catch (error) {
      print('Error fetching categories: $error');
      return null;
    }
  }

  Future<List<Result>?> fetchFeed() async {
    var headers = {
      'Cookie': 'csrftoken=wKhakEW9eYBjXe3SIOVMjk3wnYbU2f4a; sessionid=7m7d7xg671nlubp6xr3cgphfbvgmzn0m'
    };
    var request = http.Request('GET', Uri.parse('https://frijo.noviindus.in/api/home'));

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 202) {
        String responseBody = await response.stream.bytesToString();
        Feed feed = feedFromJson(responseBody);
        return feed.results;
      } else {
        print('Failed to fetch feed: ${response.reasonPhrase}');
        return null;
      }
    } catch (error) {
      print('Error fetching feed: $error');
      return null;
    }
  }
}
