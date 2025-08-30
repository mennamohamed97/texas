import 'package:flutter/material.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/features/profile/models/switch_option_model.dart';
import 'package:texas/features/profile/presentation/widgets/switch_option.dart';

class SwitchOptionsList extends StatefulWidget {
  const SwitchOptionsList({super.key});

  @override
  State<SwitchOptionsList> createState() => _SwitchOptionsListState();
}

class _SwitchOptionsListState extends State<SwitchOptionsList> {
  static List<SwitchOptionModel> switchOptions = [
    SwitchOptionModel(
      title: "Marketing Communication",
      icon: "assets/icons/marketing.svg",
      description:
          "Once you open it you will receive emails and offer on your inbox",
      value: true,
    ),
    SwitchOptionModel(
      title: "App Communication",
      icon: "assets/icons/app.svg",
      description:
          "Once you open it you will receive Notifications from our app",
      value: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.whiteColor,
      padding: EdgeInsets.only(bottom: 48, top: 33, left: 27, right: 29),
      child: Column(
        children: List.generate(switchOptions.length, (index) {
          return Column(
            children: [
              SwitchOption(
                switchOption: switchOptions[index],
                onChanged: (val) {
                  setState(() {
                    switchOptions[index].value = val;
                  });
                },
              ),
              if (index != switchOptions.length - 1)
                Divider(
                  height: 30,
                  thickness: 1,
                  color: ColorsManager.dividerColor,
                ),
            ],
          );
        }),
      ),
    );
  }
}
