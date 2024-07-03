import 'package:flutter/material.dart';
import 'package:noviindus_task2/common/utils/secrets.dart';
import 'package:noviindus_task2/features/auth/data/repository/login_repository.dart';
import 'package:noviindus_task2/features/home/presentation/pages/home_screen.dart';

import '../data/model/token.dart';

class LoginScreenProvider extends ChangeNotifier {
  LoginRepository repository = LoginRepository();
  Token? _token;
  bool _isLoading = false;
  String? _errorMessage;

  Token? get users => _token;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts({required BuildContext context, required String phone}) async {
    _isLoading = true;
    notifyListeners();
    try {
      _token = await repository.login(phone: phone);
      if (_token != null) {
        Secrets.token = _token?.token?.access;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        _errorMessage = 'Failed to Login';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage!)),
        );
      }
      _errorMessage = null;
    } catch (error) {
      debugPrint(error.toString());
      _errorMessage = 'Failed to Login';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_errorMessage!)),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
