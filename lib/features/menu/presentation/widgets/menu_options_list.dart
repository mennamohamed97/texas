import 'package:flutter/material.dart';
import 'package:texas/features/menu/data/models/menu_options_model.dart';
import 'package:texas/features/menu/presentation/widgets/menu_options_item.dart';

class MenuOptionsList extends StatefulWidget {
  const MenuOptionsList({super.key});

  @override
  State<MenuOptionsList> createState() => _MenuOptionsListState();
}

class _MenuOptionsListState extends State<MenuOptionsList> {
  int selectedIndex = 0;

  static final List<MenuOptionsModel> menuOptions = [
    const MenuOptionsModel(
      option: "Sandwiches",
      image: "assets/images/sandwich.png",
      isSelected: true,
    ),
    const MenuOptionsModel(
      option: "Limited Time Offers",
      image: "assets/images/meal.png",
      isSelected: false,
    ),
    const MenuOptionsModel(
      option: "Star Box Meals",
      image: "assets/images/meal.png",
      isSelected: false,
    ),
    const MenuOptionsModel(
      option: "Family & Shared Meals",
      image: "assets/images/meal.png",
      isSelected: false,
    ),
    const MenuOptionsModel(
      option: "Chicken Meals",
      image: "assets/images/meal.png",
      isSelected: false,
    ),
    const MenuOptionsModel(
      option: "Kids Meals",
      image: "assets/images/meal.png",
      isSelected: false,
    ),
    const MenuOptionsModel(
      option: "Sides And Desserts",
      image: "assets/images/meal.png",
      isSelected: false,
    ),
    const MenuOptionsModel(
      option: "Beverages",
      image: "assets/images/meal.png",
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(menuOptions.length, (index) {
          final option = menuOptions[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: MenuOptionsItem(
                menuOption: MenuOptionsModel(
                  option: option.option,
                  image: option.image,
                  isSelected: index == selectedIndex,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
