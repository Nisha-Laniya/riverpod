
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../models/user_model2(fullmodel).dart';

class ApiServices2 {
  String endPoint = 'https://reqres.in/api/users?page=2';
  Future<UserModel2> getUserData() async {
    try {
      final response = await http.get(Uri.parse(endPoint));
      var userData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return UserModel2.fromJson(userData);
      } else {
        return UserModel2.fromJson(userData);
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }}
