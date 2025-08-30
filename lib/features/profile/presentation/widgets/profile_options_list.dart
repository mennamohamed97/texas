import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/features/profile/models/profile_option_model.dart';
import 'package:texas/features/profile/presentation/widgets/profile_option.dart';

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  static const List<ProfileOptionModel> profileOptions = [
    ProfileOptionModel(title: "My Addresses", icon: "assets/icons/address.svg"),
    ProfileOptionModel(
      title: "Change Password",
      icon: "assets/icons/password.svg",
    ),
    ProfileOptionModel(title: "Offers", icon: "assets/icons/offer.svg"),
    ProfileOptionModel(title: "Deals", icon: "assets/icons/deal.svg"),
    ProfileOptionModel(
      title: "Notifications",
      icon: "assets/icons/notification.svg",
      isNotificationOption: true,
    ),
    ProfileOptionModel(
      title: "Delete my Account",
      icon: "assets/icons/delete.svg",
      isDeleteAccountOption: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.whiteColor,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 35.w,
          top: 22.h,
          bottom: 28.h,
        ),
        child: Column(
          children: List.generate(profileOptions.length, (index) {
            return Column(
              children: [
                ProfileOption(profileOption: profileOptions[index]),
                if (index != profileOptions.length - 1)
                  Divider(
                    height: 30,
                    thickness: 1,
                    color: ColorsManager.dividerColor,
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
