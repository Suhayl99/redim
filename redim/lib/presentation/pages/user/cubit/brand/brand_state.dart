import 'package:equatable/equatable.dart';
import 'package:redim/data/model/brand_model.dart';

enum BrandStateEnum { initial, loading, success, failed }

// ignore: must_be_immutable
class BrandState extends Equatable {
  BrandStateEnum status;
  BrandModel? brandModel;
  Exception? exception;
  BrandState({this.status = BrandStateEnum.initial, this.brandModel, this.exception});

  @override
  List<Object?> get props => [status, brandModel, exception];

  BrandState copyWith({BrandStateEnum? status, BrandModel? brandModel, Exception? exception}) {
    return BrandState(
      status: status ?? this.status,
      brandModel: brandModel ?? this.brandModel,
      exception: exception ?? this.exception,
    );
  }
}
