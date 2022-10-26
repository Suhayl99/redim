import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redim/config/constants/app_colors.dart';
import 'package:redim/config/constants/app_text_styles.dart';
import 'package:redim/config/constants/assets.dart';

import 'components/top_brands.dart';
import 'components/top_categories.dart';
import 'components/user_info.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.bgGradient),
        child: Column(
          children: [
            const CustomAppBar(),
            const UserInfo(),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                child: Container(
                  color: AppColors.baseLight.shade100,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 23.h, bottom: 110.h),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, right: 27.8.w, bottom: 20.h),
                        child: Row(
                          children: [
                            Text('Top Brands', style: AppTextStyles.head22w7),
                            const Spacer(),
                            Text('See All', style: AppTextStyles.body14w6.copyWith(color: AppColors.blue)),
                            SizedBox(width: 9.3.w),
                            SvgPicture.asset(Assets.icons.right, width: 5.8.w, height: 10.h),
                          ],
                        ),
                      ),
                      const TopBrands(),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, right: 27.8.w, top: 25.h, bottom: 20.h),
                        child: Row(
                          children: [
                            Text('Top Categories', style: AppTextStyles.head22w7),
                            const Spacer(),
                            Text('See All', style: AppTextStyles.body14w6.copyWith(color: AppColors.blue)),
                            SizedBox(width: 9.3.w),
                            SvgPicture.asset(Assets.icons.right, width: 5.8.w, height: 10.h),
                          ],
                        ),
                      ),
                      TopCategories(),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, right: 27.8.w, top: 30.h, bottom: 20.h),
                        child: Row(
                          children: [
                            Text('Recently Visited', style: AppTextStyles.head22w7),
                            const Spacer(),
                            Text('See All', style: AppTextStyles.body14w6.copyWith(color: AppColors.blue)),
                            SizedBox(width: 9.3.w),
                            SvgPicture.asset(Assets.icons.right, width: 5.8.w, height: 10.h),
                          ],
                        ),
                      ),
                      Text(
                        'Shop on your interested stores just viewed!',
                        style: AppTextStyles.body16w4.copyWith(color: AppColors.secondaryTextColor),
                        textAlign: TextAlign.center,
                      ),
                      Center(
                        child: Container(
                          width: 330.w,
                          height: 110.h,
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                          margin: EdgeInsets.symmetric(vertical: 30.h),
                          decoration: BoxDecoration(
                            color: AppColors.whiteBlue,
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(Assets.icons.friends, width: 48.w, height: 48.h),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Invite your friends!', style: AppTextStyles.body16w6),
                                  Text(
                                    'To earn extra cashback when \nthey spend at Redim\nmerchant locations',
                                    style: AppTextStyles.body12w4,
                                  ),
                                ],
                              ),
                              Container(
                                width: 44.w,
                                height: 44.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppColors.blue,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(Assets.icons.arrow, width: 16.4.w, height: 14.h),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 56.h, bottom: 28.h),
      padding: EdgeInsets.only(left: 24.w, right: 21.w),
      child: Row(
        children: [
          SvgPicture.asset(Assets.icons.logo, width: 82.w, height: 20.h),
          const Spacer(),
          SvgPicture.asset(Assets.icons.bell, width: 20.4.w, height: 22.h),
          SizedBox(width: 25.7.w),
          SvgPicture.asset(Assets.icons.search, width: 19.8.w, height: 19.8.h),
        ],
      ),
    );
  }
}
