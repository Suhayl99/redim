import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/repository/brand_repository_impl.dart';
import 'data/repository/category_repository_impl.dart';
import 'data/repository/user_repository_impl.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/user/cubit/brand/brand_cubit.dart';
import 'presentation/pages/user/cubit/category/category_cubit.dart';
import 'presentation/pages/user/cubit/user/user_cubit.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 980),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<UserCubit>(
              create: (BuildContext context) => UserCubit(
                userRepository: UserRepositoryImpl(),
              ),
            ),
            BlocProvider<BrandCubit>(
              create: (BuildContext context) => BrandCubit(brandRepository: BrandRepositoryImpl()),
            ),
            BlocProvider<CategoryCubit>(
              create: (BuildContext context) => CategoryCubit(categoryRepository: CategoryRepositoryImpl()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'OpenSans'),
            home: child,
          ),
        );
      },
      child: const HomePage(),
    );
  }
}
