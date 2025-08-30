import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/features/profile/models/switch_option_model.dart';

class SwitchOption extends StatelessWidget {
  final SwitchOptionModel switchOption;
  final ValueChanged<bool> onChanged;

  const SwitchOption({
    super.key,
    required this.switchOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: SvgPicture.asset(switchOption.icon)),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                switchOption.title,
                style: TextStyles.font16BlackSemiBold.copyWith(
                  height: 0,
                  color: ColorsManager.blackColor,
                ),
              ),
              Text(
                switchOption.description,
                style: TextStyles.font14DarkGraySemiBold.copyWith(height: 1.3),
              ),
            ],
          ),
        ),
        CupertinoSwitch(
          activeTrackColor: ColorsManager.blackColor,
          inactiveTrackColor: ColorsManager.blackColor,
          inactiveThumbColor: ColorsManager.mainYellow,
          thumbColor: ColorsManager.lightGreyColor,
          trackOutlineWidth: WidgetStateProperty.all(6),
          trackOutlineColor: WidgetStateProperty.all(ColorsManager.blackColor),
          thumbIcon: WidgetStateProperty.all(
            Icon(Icons.check, color: ColorsManager.blackColor),
          ),

          value: switchOption.value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
