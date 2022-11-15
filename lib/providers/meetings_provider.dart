import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:nonce/nonce.dart';

class MeetingsProvider extends ChangeNotifier {
  MeetingsProvider() {
    auth();
    getMeetings();
  }

  static const String _baseURL = "webexapis.com";
  static const String _authURI = "/v1/authorize";
  static const String _clientID = "C121828797a0665bf0bca63ca9c3409b379b185bf2b8d95ae450907e5859ba702";
  static const String _redirectURI = "beyond";

  auth() async {
    /*Uri endpoint = Uri.https(_baseURL, _authURI, {
      'response_type': 'code',
      'client_id': _clientID,
      'redirect_uri': '$_redirectURI:/',
      'scope': 'meeting:schedules_read',
    });*/

    Uri endpoint = Uri.https(_baseURL, _authURI, {
      'response_type': 'code',
      'scope': 'openid',
      'nonce': Nonce.generate(32, Random.secure()),
      'client_id': _clientID,
    });

    try {
      final result = await FlutterWebAuth.authenticate(
          url: endpoint.toString(), callbackUrlScheme: _redirectURI);
      final response = await http.get(endpoint);
      final code = Uri.parse(result).queryParameters['code'];
      print(response.body);
      print(code);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  getMeetings() async {}
}
