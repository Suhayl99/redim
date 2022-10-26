import 'package:redim/data/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> fetchUser();
}
