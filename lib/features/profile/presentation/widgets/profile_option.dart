import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/features/profile/models/profile_option_model.dart';

class ProfileOption extends StatelessWidget {
  final ProfileOptionModel profileOption;
  const ProfileOption({super.key, required this.profileOption});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (profileOption.isNotificationOption == true)
          Badge(
            label: Text("1", style: TextStyles.font10WhiteRegular),
            backgroundColor: ColorsManager.mainYellow,
            offset: Offset(6, -6),
            child: SvgPicture.asset(profileOption.icon),
          ),
        if (profileOption.isNotificationOption == false)
          SvgPicture.asset(profileOption.icon),
        SizedBox(width: 14.w),

        Expanded(
          child: Text(
            profileOption.title,
            style: TextStyles.font16BlackSemiBold.copyWith(
              color: profileOption.isDeleteAccountOption!
                  ? ColorsManager.darkRedColor
                  : ColorsManager.blackColor,
            ),
          ),
        ),
        if (!profileOption.isDeleteAccountOption!)
          const Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: ColorsManager.darkBlackColor,
          ),
      ],
    );
  }
}
