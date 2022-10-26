import 'dart:convert';

import 'package:http/http.dart';

import '../../config/constants/constants.dart';
import '../../config/constants/urls.dart';
import '../../domain/repository/brand_repository.dart';
import '../model/brand_model.dart';

class BrandRepositoryImpl extends BrandRepository {
  @override
  Future<BrandModel> fetchBrands() async {
    try {
      var response = await get(
        Url.brands,
        headers: {"x-api-key": apiKey, "Authorization": token},
      );
      if (response.statusCode == 200) {
        return BrandModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('status code : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }
}
