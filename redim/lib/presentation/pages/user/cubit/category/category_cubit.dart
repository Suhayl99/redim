
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/category_model.dart';
import '../../../../../domain/repository/Category_repository.dart';
import 'Category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.categoryRepository}) : super(CategoryState());
  CategoryRepository categoryRepository;
  late CategoryModel categoryModel;
  getCategoryData() async {
    emit(state.copyWith(status: CategoryStateEnum.loading));
    try {
      categoryModel = await categoryRepository.fetchCategories();
      emit(state.copyWith(status: CategoryStateEnum.success, categoryModel: categoryModel));
    } on Exception catch (exception) {
      emit(state.copyWith(status: CategoryStateEnum.failed, exception: exception));
    }
  }
}


// {
//     "status": true,
//     "data": {
//         "categories": [{
//             "id": 1,
//             "name_en": "Apparel",
//             "name_bn": "Apparel",
//             "slug": "apparel",
//             "icon": "https:\/\/s3.ap-southeast-1.wasabisys.com\/redim\/categories\/apparel.svg",
//             "color": "60DDA1",
//             "is_top": 1,
//             "is_active": 1,
//             "priority": 1,
//             "name": "Apparel"
//         }]
//     }
// }