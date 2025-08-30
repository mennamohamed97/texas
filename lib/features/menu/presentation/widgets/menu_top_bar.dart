import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texas/core/theming/text_styles.dart';

class MenuTopBar extends StatelessWidget {
  const MenuTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Explore Menu'.toUpperCase(), style: TextStyles.font18BlackBold),
          SvgPicture.asset('assets/icons/search.svg'),
        ],
      ),
    );
  }
}
