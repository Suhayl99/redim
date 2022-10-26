import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redim/data/model/category_model.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
import '../cubit/category/Category_state.dart';
import '../cubit/category/category_cubit.dart';

class TopCategories extends StatefulWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  State<TopCategories> createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      switch (state.status) {
        case CategoryStateEnum.initial:
          context.read<CategoryCubit>().getCategoryData();
          return SizedBox(height: 110.h, child: const CupertinoActivityIndicator());
        case CategoryStateEnum.loading:
          return SizedBox(height: 110.h, child: const CupertinoActivityIndicator());
        case CategoryStateEnum.success:
          return Container(
            height: 115.h,
            alignment: Alignment.center,
            child: isExpanded
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 12.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: context.read<CategoryCubit>().categoryModel.data?.categories?.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                          categoryModel: context.read<CategoryCubit>().categoryModel.data?.categories?[index]);
                    },
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 12.w),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        4,
                        (index) => CategoryItem(
                          categoryModel: context.read<CategoryCubit>().categoryModel.data?.categories?[index],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          isExpanded = !isExpanded;
                        }),
                        child: Column(
                          children: [
                            Container(
                              width: 58.w,
                              height: 58.w,
                              padding: EdgeInsets.all(12.w),
                              margin: EdgeInsets.symmetric(horizontal: 6.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.whiteBlue,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  Assets.icons.arrow,
                                  width: 20.w,
                                  height: 17.h,
                                  color: AppColors.blue,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 8.h),
                                alignment: Alignment.center,
                                width: 58.w,
                                child: Text(
                                  'See All',
                                  style: AppTextStyles.body12w4,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        case CategoryStateEnum.failed:
          return SizedBox(height: 180.h, child: const CupertinoActivityIndicator());
        default:
          return SizedBox(height: 180.h, child: const CupertinoActivityIndicator());
      }
    });
  }
}

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key, required this.categoryModel}) : super(key: key);
  Categories? categoryModel;

  @override
  Widget build(BuildContext context) {
    int color = int.parse("0xff${categoryModel?.color}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 58.w,
          height: 58.w,
          padding: EdgeInsets.all(12.w),
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Color(color),
          ),
          child: SvgPicture.network(categoryModel?.icon ?? ''),
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 8.h),
            width: 58.w,
            child: Text(
              categoryModel?.name ?? 'Eyewear \n& Optics',
              style: AppTextStyles.body12w4,
            ))
      ],
    );
  }
}
