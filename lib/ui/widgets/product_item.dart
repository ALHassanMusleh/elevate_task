import 'package:elevate_task/utils/app_colors.dart';
import 'package:elevate_task/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.secondary.withOpacity(0.6)),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              Image.network(
                'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.19,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.primaryTextStyle,
              ),
              Text(
                'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.primaryTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'EGP 109.95',
                    maxLines: 1,
                    style: AppStyles.primaryTextStyle,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '2000 EGP',
                    maxLines: 1,
                    style: AppStyles.secondaryTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Review (4.6)',
                        style: AppStyles.subTitleTextStyle,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.add_circle,
                    size: 36,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ],
          ),
          const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.favorite_outline_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
