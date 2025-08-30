import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/core/utils/cubit/main_cubit.dart';
import 'package:texas/core/utils/cubit/main_states.dart';
import 'package:texas/features/menu/presentation/controller/menu_items_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainStates>(
      buildWhen: (previous, current) => current is ChangeBottomNavBarState,
      builder: (context, state) {
        final itemCount = context.select<MenuItemsCubit, int>((cubit) {
          final menuState = cubit.state;
          if (menuState is MenuLoaded) return menuState.items.length;
          return 0;
        });

        return Scaffold(
          backgroundColor: ColorsManager.whiteColor,
          body: mainCubit.pages[mainCubit.currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: ColorsManager.whiteColor,
                  unselectedItemColor: ColorsManager.darkGreyColor,
                  selectedItemColor: ColorsManager.blackColor,
                  selectedLabelStyle: TextStyles.font14BlackSemiBold.copyWith(
                    height: 16 / 14,
                  ),
                  unselectedLabelStyle: TextStyles.font14BlackSemiBold.copyWith(
                    height: 16 / 14,
                  ),
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset('assets/icons/home.svg'),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset(
                          'assets/icons/home.svg',
                          colorFilter: ColorFilter.mode(
                            ColorsManager.mainYellow,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset('assets/icons/menu.svg'),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset(
                          'assets/icons/menu.svg',
                          colorFilter: ColorFilter.mode(
                            ColorsManager.mainYellow,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: 'Menu',
                    ),
                    BottomNavigationBarItem(
                      icon: Badge(
                        label: Text(
                          itemCount.toString(),
                          style: TextStyles.font18BlackSemiBold,
                        ),
                        textColor: ColorsManager.blackColor,
                        backgroundColor: ColorsManager.whiteColor,
                        offset: const Offset(-65, 15),
                        child: SvgPicture.asset('assets/icons/cart.svg'),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset('assets/icons/profile.svg'),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset(
                          'assets/icons/profile.svg',
                          colorFilter: ColorFilter.mode(
                            ColorsManager.mainYellow,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset('assets/icons/more.svg'),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SvgPicture.asset(
                          'assets/icons/more.svg',
                          colorFilter: ColorFilter.mode(
                            ColorsManager.mainYellow,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: 'More',
                    ),
                  ],

                  currentIndex: mainCubit.currentIndex,
                  onTap: (index) {
                    mainCubit.currentIndex = index;
                  },
                ),
                Positioned(
                  top: -28,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset("assets/icons/label.svg"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
