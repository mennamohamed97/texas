import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/features/profile/models/profile_shortcut_model.dart';
import 'package:texas/features/profile/presentation/widgets/profile_shortcut.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});
  static const List<ProfileShortcutModel> shortcuts = [
    ProfileShortcutModel(
      image: "assets/images/favorite.svg",
      text: "Favorites",
    ),
    ProfileShortcutModel(image: "assets/images/reward.svg", text: "Rewards"),
    ProfileShortcutModel(image: "assets/images/order.svg", text: "Orders"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.whiteColor,
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 16.h,
        bottom: 10.h,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 23.h,
              bottom: 23.h,
              left: 15.w,
              right: 10.w,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.shadowColor,
                  offset: const Offset(0, 0.97),
                  blurRadius: 8.73,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 34,
                          backgroundColor: ColorsManager.lightGreyColor,
                          child: Text(
                            "A",
                            style: TextStyles.font24DarkBlackBold,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ahmed Magdy",
                                style: TextStyles.font18BlackBold,
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/images/flag.svg"),
                                  SizedBox(width: 10.w),

                                  Text(
                                    "012-000-00-663",
                                    style: TextStyles.font18BlackSemiBold,
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                "ahmed@paradigmegypt.com",
                                style: TextStyles.font16BlackSemiBold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 38),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.mainYellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                          ),
                          child: Text(
                            "Update Profile",
                            style: TextStyles.font16DarkGrayBold.copyWith(
                              color: ColorsManager.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: -12,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset("assets/images/logout.svg"),
                      SizedBox(width: 5.w),
                      Text(
                        "Logout",
                        style: TextStyles.font16BlackSemiBold.copyWith(
                          color: ColorsManager.darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(shortcuts.length, (index) {
                return ProfileShortcut(shourtcut: shortcuts[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
