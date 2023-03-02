import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tygithub/pages/login/auth_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tygithub/common/ty_http.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String _accessToken = '';

  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(BuildContext context) async {
    final authUrl =
        'https://github.com/login/oauth/authorize?client_id=${dotenv.env['GITHUB_CLIENT_ID']}&scope=user%20repo&redirect_uri=tygithubapp://authed';

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TYAuthPage(authUrl: authUrl),
      ),
    );

    if (result != null && result.containsKey('code')) {
      final code = result['code'];
      final accessToken = await _getAccessToken(code);
      if (accessToken.isNotEmpty) {
        print('accessToken = $accessToken');
        _accessToken = accessToken;
        _isLoggedIn = true;
        notifyListeners();
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('access_token', accessToken);
      }
    }
  }

  Future<String> _getAccessToken(String code) async {
    const url = 'https://github.com/login/oauth/access_token';

    final response = await TYHttp().post(url, params: {
      'client_id': dotenv.env['GITHUB_CLIENT_ID'],
      'client_secret': dotenv.env['GITHUB_CLIENT_SECRET'],
      'code': code,
    });
    if (response != null && response.statusCode == 200) {
      String accessToken = response.data['access_token'] as String;
      return accessToken;
    }
    return '';
  }

  Future<void> logout() async {
    _accessToken = '';
    _isLoggedIn = false;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }

  Future<void> tryAutoLogin() async {
    debugPrint('tryAutoLogin');
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    if (accessToken != null && accessToken.isNotEmpty) {
      _accessToken = accessToken;
      _isLoggedIn = true;
      notifyListeners();
    }
  }
}
