import 'package:flutter/material.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/features/menu/data/models/menu_options_model.dart';

class MenuOptionsItem extends StatelessWidget {
  final MenuOptionsModel menuOption;

  const MenuOptionsItem({super.key, required this.menuOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15, left: 2),
      decoration: BoxDecoration(
        color: menuOption.isSelected
            ? ColorsManager.mainYellow
            : ColorsManager.whiteColor,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(color: ColorsManager.mainYellow, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.whiteColor,
            ),
            child: Center(
              child: Image.asset(menuOption.image, width: 38, height: 30),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            menuOption.option,
            style: TextStyles.font16BlackSemiBold.copyWith(
              color: ColorsManager.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
