import 'package:flutter_bubble_tea_app/components/drink_tile.dart';
import 'package:flutter_bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../pages/CartBloc.dart';
import '../models/drink.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: _CartPageContent(),
    );
  }
}

class _CartPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const Text(
                  'Cart',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cart.length,
                    itemBuilder: (context, index) {
                      Drink drink = state.cart[index];
                      return Column(
                        children: [
                          DrinkTile(
                            drink: drink,
                            onTap: () {
                              context.read<CartBloc>().add(RemoveFromCartEvent(drink));
                            },
                            trailing: const Icon(Icons.delete),
                          ),
                          const SizedBox(height: 10)
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}