import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/features/profile/models/profile_shortcut_model.dart';

class ProfileShortcut extends StatelessWidget {
  final ProfileShortcutModel shourtcut;
  const ProfileShortcut({super.key, required this.shourtcut});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 38,
          backgroundColor: ColorsManager.lightYellow,
          child: Center(child: SvgPicture.asset(shourtcut.image)),
        ),
        Text(
          shourtcut.text,
          style: TextStyles.font16BlackSemiBold.copyWith(
            color: ColorsManager.blackColor,
          ),
        ),
      ],
    );
  }
}
