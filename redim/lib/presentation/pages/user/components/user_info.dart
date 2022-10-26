import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants/app_text_styles.dart';
import '../cubit/user/user_cubit.dart';
import '../cubit/user/user_state.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (BuildContext context, state) {
        switch (state.status) {
          case UserStateEnum.initial:
            context.read<UserCubit>().getUserData();
            return const DefaulContainer();
          case UserStateEnum.loading:
            return const DefaulContainer();
          case UserStateEnum.success:
            return Container(
              margin: EdgeInsets.only(bottom: 21.h),
              padding: EdgeInsets.only(left: 22.w),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.userModel?.data?.user?[0].name??'', style: AppTextStyles.body18w7),
                  Text(r'$0.00', style: AppTextStyles.head26w7),
                  Text(state.userModel?.data?.portfolioValue.toString()??'', style: AppTextStyles.body12w6),
                ],
              ),
            );
          case UserStateEnum.failed:
            return const DefaulContainer();
          default: return const DefaulContainer();
        }
      },
    );
  }
}

class DefaulContainer extends StatelessWidget {
  const DefaulContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 21.h),
      padding: EdgeInsets.only(left: 22.w),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' ', style: AppTextStyles.body18w7),
          Text(' ', style: AppTextStyles.head26w7),
          Text(' ', style: AppTextStyles.body12w6),
        ],
      ),
    );
  }
}
