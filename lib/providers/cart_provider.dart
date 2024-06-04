import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return {};
  }

  addProduct(Product product) {
    if (state.contains(product)) {
      return;
    }
    state = {...state, product};
  }

  removeProduct(Product product) {
    if (state.contains(product)) {
      state = state
          .where(
            (element) => element.id != product.id,
          )
          .toSet();
    }
  }
}

final cartNotifierProvider =
    NotifierProvider<CartNotifier, Set<Product>>(() => CartNotifier());

final cartItemsNumberProvider =
    Provider((ref) => ref.watch(cartNotifierProvider).length);

final cartTotalProvider = Provider((ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (var item in cartProducts) {
    total += item.price;
  }
  return total;
});
