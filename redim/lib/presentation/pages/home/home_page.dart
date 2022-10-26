import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redim/config/constants/app_colors.dart';
import 'package:redim/presentation/pages/user/user_page.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../config/constants/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const UserPage(),
         Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 330.w,
              height: 60.h,
              margin: EdgeInsets.only(bottom: 34.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: AppColors.baseLight.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    offset: const Offset(0, 6),
                    blurRadius: 16.r,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 30.w,
                    height: 45.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(Assets.icons.home, width: 22.w, height: 22.h),
                        SizedBox(height: 5.h),
                        Text('Home', style: AppTextStyles.body10w6.copyWith(color: AppColors.blue)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                    height: 45.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(Assets.icons.store, width: 21.5.w, height: 22.h),
                        SizedBox(height: 5.h),
                        Text('All Shopes', style: AppTextStyles.body10w6),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 45.w,
                    height: 45.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(Assets.icons.portfolio, width: 22.w, height: 22.h),
                        SizedBox(height: 5.h),
                        Text('Portfolio', style: AppTextStyles.body10w6),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                    height: 45.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(Assets.icons.menu, width: 22.w, height: 15.h),
                        SizedBox(height: 5.h),
                        Text('Menu', style: AppTextStyles.body10w6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
