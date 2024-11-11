import 'package:flutter/material.dart';
import 'package:candy_store/cart_view_model.dart';

class CartViewModelProvider extends InheritedWidget {
  final CartViewModel cartViewModel;

  const CartViewModelProvider({
    super.key,
    required this.cartViewModel,
    required Widget child,
  }) : super(child: child);

  static CartViewModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartViewModelProvider>()!.cartViewModel;
  }

  @override
  bool updateShouldNotify(CartViewModelProvider oldWidget) {
    return cartViewModel != oldWidget.cartViewModel;
  }
  
}