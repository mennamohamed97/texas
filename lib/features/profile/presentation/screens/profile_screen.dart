import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/features/profile/presentation/widgets/profile_info.dart';
import 'package:texas/features/profile/presentation/widgets/profile_options_list.dart';
import 'package:texas/features/profile/presentation/widgets/switch_options_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.extraLightGreyColor,
        appBar: AppBar(
          backgroundColor: ColorsManager.whiteColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 17.w),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.lightGrey,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset("assets/icons/left_arrow.svg"),
              ),
            ),
          ),
          title: Text(
            "Profile".toUpperCase(),
            style: TextStyles.font18BlackBold,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),
              ProfileInfo(),
              SizedBox(height: 11.h),
              ProfileOptionsList(),
              SizedBox(height: 11.h),
              SwitchOptionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
