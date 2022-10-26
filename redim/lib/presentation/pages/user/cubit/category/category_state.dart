import 'package:equatable/equatable.dart';

import '../../../../../data/model/category_model.dart';

enum CategoryStateEnum { initial, loading, success, failed }

// ignore: must_be_immutable
class CategoryState extends Equatable {
  CategoryStateEnum status;
  CategoryModel? categoryModel;
  Exception? exception;
  CategoryState({this.status = CategoryStateEnum.initial, this.categoryModel, this.exception});

  @override
  List<Object?> get props => [status, categoryModel, exception];

  CategoryState copyWith({CategoryStateEnum? status, CategoryModel? categoryModel, Exception? exception}) {
    return CategoryState(
      status: status ?? this.status,
      categoryModel: categoryModel ?? this.categoryModel,
      exception: exception ?? this.exception,
    );
  }
}


