import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:riverpod_example/models/user_model.dart';

class ApiServices {
  String endPoint = 'https://reqres.in/api/users?page=2';



  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(endPoint));
    if(response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

