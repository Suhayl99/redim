
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redim/data/model/brand_model.dart';
import 'package:redim/domain/repository/brand_repository.dart';

import 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit({required this.brandRepository}) : super(BrandState());
  BrandRepository brandRepository;
  late BrandModel brandModel;
  getBrands() async {
    emit(state.copyWith(status: BrandStateEnum.loading));
    try {
      brandModel = await brandRepository.fetchBrands();
      emit(state.copyWith(status: BrandStateEnum.success, brandModel: brandModel));
    } on Exception catch (exception) {
      emit(state.copyWith(status: BrandStateEnum.failed, exception: exception));
    }
  }
}