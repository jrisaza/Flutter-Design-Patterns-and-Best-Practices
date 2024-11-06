import 'package:candy_store/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:candy_store/cart_notifier.dart';
import 'package:candy_store/cart_notifier_provider.dart';

class CartListItemView extends StatelessWidget {
  final CartListItem item;

  CartListItemView({
    Key? key,
    required this.item,
    //required this.onRemoveFromCart,
    //required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = item.product;
    final iconColor = Theme.of(context).colorScheme.secondary;
    CartNotifier cartNotifier = CartProvider.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(product.imageUrl),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      product.description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => cartNotifier.removeFromCart(item),
                          icon: Icon(
                            Icons.remove,
                            color: iconColor,
                          ),
                        ),
                        Text(
                          '${item.quantity}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => cartNotifier.addToCart(item.product),
                          icon: Icon(
                            Icons.add,
                            color: iconColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '${product.price * item.quantity}€',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
