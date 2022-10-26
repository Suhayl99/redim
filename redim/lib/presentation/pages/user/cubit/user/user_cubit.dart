import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redim/data/model/user_model.dart';
import 'package:redim/domain/repository/user_repository.dart';

import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.userRepository}) : super(UserState());
  UserRepository userRepository;
  late UserModel userModel;
  getUserData() async {
    emit(state.copyWith(status: UserStateEnum.loading));
    try {
      userModel = await userRepository.fetchUser();
      emit(state.copyWith(status: UserStateEnum.success, userModel: userModel));
    } on Exception catch (exception) {
      emit(state.copyWith(status: UserStateEnum.failed, exception: exception));
    }
  }
}
