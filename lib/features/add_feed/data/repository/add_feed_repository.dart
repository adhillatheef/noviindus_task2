import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:noviindus_task2/common/utils/secrets.dart';

class AddFeedRepository {
  final String _baseUrl = 'https://frijo.noviindus.in/api/';
  final String _token = 'Bearer ${Secrets.token}';

  Future<bool> uploadFeed({
    required File video,
    required File image,
    required String description,
    required List<int> categoryList,
  }) async {
    var headers = {
      'Authorization': _token,
      'Cookie': 'csrftoken=dAGuAK0lkXLXIvmI6fLuIfOQ9Dfy9grF; sessionid=7m7d7xg671nlubp6xr3cgphfbvgmzn0m'
    };

    var request = http.MultipartRequest('POST', Uri.parse('${_baseUrl}my_feed'));
    request.headers.addAll(headers);

    request.fields['desc'] = description;
    request.fields['category'] = categoryList.toString();

    request.files.add(await http.MultipartFile.fromPath('video', video.path));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        print('Failed to upload feed: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print('Error uploading feed: $e');
      return false;
    }
  }
}
