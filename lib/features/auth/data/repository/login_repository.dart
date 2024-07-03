import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:noviindus_task2/features/auth/data/model/token.dart';

class LoginRepository {
  Future<Token?> login({required String phone}) async {
    final url = Uri.parse('https://frijo.noviindus.in/api/otp_verified');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Cookie': 'csrftoken=5Mq17Uqn3SaAj9J0qtC3NexMzcwzEkLg; sessionid=zi4m27d1pxbei31pnhpp5c36nc17gp0f'
        },
        body: {
          'country_code': '91',
          'phone': '8129466718',
        },
      );

      if (response.statusCode == 202) {
        Token token = Token.fromJson(json.decode(response.body));
        return token;
      } else {
        print('Failed to login: ${response.statusCode}');
        print('Response: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }
}
