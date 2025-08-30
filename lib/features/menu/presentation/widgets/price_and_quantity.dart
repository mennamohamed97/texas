import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:texas/core/theming/text_styles.dart';
import 'package:texas/features/menu/data/models/item_model.dart';

class PriceAndQuantity extends StatefulWidget {
  final Item item;
  final bool isLoading;
  const PriceAndQuantity({
    super.key,
    required this.item,
    required this.isLoading,
  });

  @override
  State<PriceAndQuantity> createState() => _PriceAndQuantityState();
}

class _PriceAndQuantityState extends State<PriceAndQuantity> {
  bool isInCart = true;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              Text(
                "${widget.item.itemPrice.toString()} BD",
                style: TextStyles.font20BlackBold,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  "${widget.item.itemPrice.toString()} BD",
                  style: TextStyles.font16DarkGrayBold.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),

                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (!widget.isLoading)
          if (!isInCart)
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isInCart = true;
                      quantity = 1;
                    });
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGreyColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/icons/remove.svg"),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  quantity.toString(),
                  style: TextStyles.font20DarkBlackExtraBold,
                ),
                SizedBox(width: 12),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: ColorsManager.mainYellow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/icons/add.svg"),
                    ),
                  ),
                ),
              ],
            ),
        if (!widget.isLoading)
          if (isInCart)
            GestureDetector(
              onTap: () {
                setState(() {
                  isInCart = false;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorsManager.mainYellow,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Center(child: SvgPicture.asset("assets/icons/add.svg")),
                      SizedBox(width: 3),
                      Text(" ADD", style: TextStyles.font18BlackSemiBold),
                    ],
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
