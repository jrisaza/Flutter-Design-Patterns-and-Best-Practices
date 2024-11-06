import 'package:candy_store/cart_button.dart';
import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/cart_page.dart';
import 'package:candy_store/product_list_item.dart';
import 'package:candy_store/products_page.dart';
import 'package:flutter/material.dart';
import 'package:candy_store/cart_notifier_provider.dart';
import 'package:candy_store/cart_notifier.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late CartNotifier cartNotifier;
  //final List<CartListItem> cartItems = []; // no longer needed due to CartNotifier

  // The Map key is the id of the CartListItem. We will use a Map data structure
  // because it is easier to manage the addition, removal & count of the items.
  final Map<String, CartListItem> cartItemsMap = {};

  @override
  Widget build(BuildContext context) {
    final totalCount = cartNotifier.totalItems;
    
    return Stack(
      children: [
        ProductsPage(),
        Positioned(
          right: 16,
          bottom: 16,
          child: GestureDetector(
            onTap: openCart,
            child: CartButton(
              count: totalCount,
            ),
          ),
        ),
      ],
    );
  }

  void openCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CartPage(
          cartNotifier: cartNotifier,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartNotifier = CartProvider.of(context); // Initialize cartNotifier from context
    cartNotifier.addListener(_updateCart);
  }

  @override
  void dispose() {
    cartNotifier.removeListener(_updateCart);
    print('MainPage dispose JRI');
    super.dispose();
  }

  void _updateCart() {
    setState(() {
      print('_updateCart in MainPage JRI');
    });
  }
  
}
