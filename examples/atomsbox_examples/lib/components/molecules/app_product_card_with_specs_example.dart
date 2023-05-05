import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppProductCardWithSpecsExample extends StatelessWidget {
  const AppProductCardWithSpecsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppProductCardWithSpecs(
          type: AppCardType.elevated,
          name: 'Product Name',
          description: AppConstants.text48,
          price: 19.99,
          onPressedAddToCart: (
            int quantity, {
            String? id,
            String? name,
          }) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: AppText('Added to cart: $quantity of $name'),
              ),
            );
          },
        ),
      ],
    );
  }
}
