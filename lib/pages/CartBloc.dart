import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/drink.dart';

class CartEvent {}

class AddToCartEvent extends CartEvent {
  final Drink drink;

  AddToCartEvent(this.drink);
}

class RemoveFromCartEvent extends CartEvent {
  final Drink drink;

  RemoveFromCartEvent(this.drink);
}

class ClearCartEvent extends CartEvent {}

class CartState {
  final List<Drink> cart;

  CartState(this.cart);
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([]));

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddToCartEvent) {
      yield CartState(List.from(state.cart)..add(event.drink));
    } else if (event is RemoveFromCartEvent) {
      yield CartState(List.from(state.cart)..remove(event.drink));
    } else if (event is ClearCartEvent) {
      yield CartState([]);
    }
  }
}
