import 'dart:io';

import 'package:flutter_testing/http_unit_test/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final http.Client client;
  UserRepository({required this.client});

  Future<User> getUser() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
    throw Exception('Some Error Occurred');
  }
}
