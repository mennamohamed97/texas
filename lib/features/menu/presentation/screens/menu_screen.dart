import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/features/menu/data/models/item_model.dart';
import 'package:texas/features/menu/presentation/controller/menu_items_cubit.dart';
import 'package:texas/features/menu/presentation/widgets/menu_options_list.dart';
import 'package:texas/features/menu/presentation/widgets/menu_top_bar.dart';
import 'package:texas/features/menu/presentation/widgets/item_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 19),
              MenuTopBar(),
              SizedBox(height: 28),
              MenuOptionsList(),
              SizedBox(height: 28),
              Expanded(
                child: BlocBuilder<MenuItemsCubit, MenuItemsState>(
                  buildWhen: (prev, current) =>
                      current is MenuLoading ||
                      current is MenuLoaded ||
                      current is MenuError,
                  builder: (context, state) {
                    int itemCount = 0;
                    if (state is MenuLoaded) {
                      itemCount = state.items.length;
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Sandwiches ',
                              style: TextStyles.font20BlackBold,
                            ),
                            state is MenuLoading
                                ? Skeletonizer(
                                    enabled: true,
                                    child: Text(
                                      '(0 Items)',
                                      style: TextStyles.font16BlackRegular,
                                    ),
                                  )
                                : Text(
                                    '($itemCount Items)',
                                    style: TextStyles.font16BlackRegular,
                                  ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (state is MenuLoading) {
                                return ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Skeletonizer(
                                      enabled: true,
                                      child: ItemCard(
                                        isLoading: true,
                                        item: Item(
                                          imageUrl:
                                              'https://fakerestaurantapi.runasp.net/images/Dosa.jpg',
                                          itemName: 'Loading...',
                                          itemDescription: '',
                                          itemPrice: 0,
                                          itemID: 0,
                                          restaurantName: 'Loading',
                                          restaurantID: 0,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else if (state is MenuLoaded) {
                                return ListView.builder(
                                  itemCount: state.items.length,
                                  itemBuilder: (context, index) {
                                    final item = state.items[index];
                                    return ItemCard(
                                      isLoading: false,
                                      item: item,
                                    );
                                  },
                                );
                              } else if (state is MenuError) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/error.png",
                                        width: 100.w,
                                      ),
                                      Text(
                                        state.message,
                                        style: TextStyles.font18BlackRegular,
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
