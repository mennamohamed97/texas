import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/features/menu/data/models/item_model.dart';
import 'package:texas/features/menu/presentation/widgets/item_image.dart';
import 'package:texas/features/menu/presentation/widgets/price_and_quantity.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  final bool isLoading;

  const ItemCard({super.key, required this.item, required this.isLoading});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 2, right: 2),
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.lightGreyColor,
            blurRadius: 6,
            offset: const Offset(0, 0),
            spreadRadius: 0,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            ItemImage(image: widget.item.imageUrl),
            const SizedBox(width: 11),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.item.itemName,
                            style: TextStyles.font20BlackBold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? ColorsManager.blackColor
                                : ColorsManager.darkBlackColor,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          iconSize: 24,
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),

                    Text(
                      widget.item.itemDescription,
                      style: TextStyles.font14DarkGrayRegular.copyWith(
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Text("Customize", style: TextStyles.font18DarkRedBold),
                        const SizedBox(width: 8),
                        if (!widget.isLoading)
                          Container(
                            height: 17,
                            width: 17,
                            decoration: BoxDecoration(
                              color: ColorsManager.darkRedColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/icons/right_arrow.svg",
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 2),
                    PriceAndQuantity(
                      item: widget.item,
                      isLoading: widget.isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
