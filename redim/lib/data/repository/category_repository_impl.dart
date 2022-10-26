import 'dart:convert';

import 'package:http/http.dart';

import '../../config/constants/constants.dart';
import '../../config/constants/urls.dart';
import '../../domain/repository/Category_repository.dart';
import '../model/category_model.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<CategoryModel> fetchCategories() async {
    try {
      var response = await get(
        Url.categories,
        headers: {"x-api-key": apiKey, "Authorization": token},
      );
      if (response.statusCode == 200) {
        return CategoryModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('status code : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }
}
