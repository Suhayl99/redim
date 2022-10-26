import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redim/presentation/pages/user/cubit/brand/brand_cubit.dart';
import 'package:redim/presentation/pages/user/cubit/brand/brand_state.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../config/constants/assets.dart';
import '../../../../data/model/brand_model.dart';

class TopBrands extends StatelessWidget {
  const TopBrands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      builder: (context, state) {
        switch (state.status) {
          case BrandStateEnum.initial:
            context.read<BrandCubit>().getBrands();
            return SizedBox(height: 180.h, child: const CupertinoActivityIndicator());
          case BrandStateEnum.loading:
            return SizedBox(height: 180.h, child: const CupertinoActivityIndicator());
          case BrandStateEnum.success:
            return Container(
              height: 180.h,
              alignment: Alignment.center,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 12.w),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: state.brandModel?.data?.stores?.length,
                itemBuilder: (context, index) {
                  return BrandItem(store: state.brandModel?.data?.stores?[index]);
                },
              ),
            );
          case BrandStateEnum.failed:
            return SizedBox(height: 180.h, child: const CupertinoActivityIndicator());
          default:
            return SizedBox(height: 180.h, child: const CupertinoActivityIndicator());
        }
      },
    );
  }
}

// ignore: must_be_immutable
class BrandItem extends StatelessWidget {
  BrandItem({Key? key, required this.store}) : super(key: key);

  Stores? store;
  String logo = '';

  @override
  Widget build(BuildContext context) {
    logo = store?.logo ?? "http://via.placeholder.com/350x150";
    return Container(
      width: 160.w,
      height: 170.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.only(left: 0.5.w, right: 0.5.w, bottom: 1, top: 0.2),
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.r),
                topRight: Radius.circular(14.r),
              ),
              child: Container(
                width: double.maxFinite,
                color: AppColors.whiteBlue,
                child: Image.network(logo, fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14.r),
                  bottomRight: Radius.circular(14.r),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.baseLight.shade100,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14.r),
                    bottomRight: Radius.circular(14.r),
                  ),
                ),
                padding: EdgeInsets.only(left: 18.w, top: 9.h),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(store?.nameEn ?? 'Company Name', style: AppTextStyles.body16w6),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.icons.star, width: 14.w, height: 14.h),
                          SizedBox(width: 7.w),
                          Text(store?.rating.toString() ?? 'rating point', style: AppTextStyles.body14w4),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text('Up to ${store?.cashbackIn ?? '5'}% ',
                            style: AppTextStyles.body12w6.copyWith(color: AppColors.blue)),
                        Text(' was ${store?.maxCashback ?? '3'}%',
                            style: AppTextStyles.body12w4.copyWith(color: AppColors.secondaryTextColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
