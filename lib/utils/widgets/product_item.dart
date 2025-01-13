import 'package:elevate_task/data/model/product.dart';
import 'package:elevate_task/utils/app_colors.dart';
import 'package:elevate_task/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: AppColors.secondary.withOpacity(0.6), width: 1.5),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              Image.network(
                product.image ?? '',
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.19,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.primaryTextStyle,
              ),
              Text(
                product.description ?? '',
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
                    'EGP ${product.price}',
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
                        'Review (${product.rating?.rate})',
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
