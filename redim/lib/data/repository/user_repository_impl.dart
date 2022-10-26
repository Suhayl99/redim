import 'dart:convert';

import 'package:http/http.dart';

import '../../config/constants/constants.dart';
import '../../config/constants/urls.dart';
import '../../domain/repository/user_repository.dart';
import '../model/user_model.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<UserModel> fetchUser() async {
    try {
      var response = await get(
        Url.userInfo,
        headers: {"x-api-key": apiKey, "Authorization": token},
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('status code : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }
}
