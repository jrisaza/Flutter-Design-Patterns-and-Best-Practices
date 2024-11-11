import 'package:candy_store/cart_list_item_view.dart';
import 'package:flutter/material.dart';
import 'package:candy_store/cart_view_model_provider.dart';

class CartPage extends StatefulWidget {

  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late var cartViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartViewModel = CartViewModelProvider.of(context); // Initialize cartNotifier from context
    cartViewModel.addListener(_updateCart);
  }

  @override
  void dispose() {
    cartViewModel.removeListener(_updateCart);
    super.dispose();
  }

  void _updateCart() {
    setState((){
      print('_updateCart in CartPage JRI');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: cartViewModel.items.length,
              itemBuilder: (context, index) {
                final item = cartViewModel.items[index];
                return CartListItemView(
                  item: item,
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${cartViewModel.totalPrice} €',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
