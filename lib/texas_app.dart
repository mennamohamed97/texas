import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texas/core/routing/app_router.dart';
import 'package:texas/core/routing/routes.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/utils/cubit/main_cubit.dart';
import 'package:texas/main.dart';

class TexasApp extends StatelessWidget {
  final AppRouter appRouter;

  const TexasApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => MainCubit(),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Texas App',
          theme: ThemeData(
            primaryColor: ColorsManager.mainYellow,
            scaffoldBackgroundColor: ColorsManager.whiteColor,
          ),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.mainScreen,
        ),
      ),
    );
    // DevicePreview(
    //       enabled: !kReleaseMode,
    //       builder: (context) {
    //         return ScreenUtilInit(
    //           designSize: const Size(375, 812),
    //           minTextAdapt: true,
    //           builder: (_, __) {
    //             return BlocProvider(
    //               create: (context) => MainCubit(),
    //               child: MaterialApp(
    //                 navigatorKey: navigatorKey,
    //                 useInheritedMediaQuery: true,
    //                 locale: DevicePreview.locale(context),
    //                 builder: DevicePreview.appBuilder,
    //                 debugShowCheckedModeBanner: false,
    //                 title: 'Foodie App',
    //                 theme: ThemeData(
    //                   primaryColor: ColorsManager.mainYellow,
    //                   scaffoldBackgroundColor: ColorsManager.whiteColor,
    //                 ),
    //                 onGenerateRoute: appRouter.generateRoute,
    //                 initialRoute: Routes.mainScreen,
    //               ),
    //             );
    //           },
    //         );
    //       },
    //     );
  }
}
