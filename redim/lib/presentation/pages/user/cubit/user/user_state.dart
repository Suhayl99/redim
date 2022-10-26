import 'package:equatable/equatable.dart';
import 'package:redim/data/model/user_model.dart';

enum UserStateEnum { initial, loading, success, failed }

// ignore: must_be_immutable
class UserState extends Equatable {
  UserStateEnum status;
  UserModel? userModel;
  Exception? exception;
  UserState({this.status = UserStateEnum.initial, this.userModel, this.exception});

  @override
  List<Object?> get props => [status, userModel, exception];

  UserState copyWith({UserStateEnum? status, UserModel? userModel, Exception? exception}) {
    return UserState(
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
      exception: exception ?? this.exception,
    );
  }
}
