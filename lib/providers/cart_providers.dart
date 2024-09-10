import 'package:riverpod_files/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_providers.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // inital value
  @override
  Set<Product> build() {
    return const {};
  }

  // methods to update state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

@riverpod
int cartTotal(ref) {
  final cartProduct = ref.watch(cartNotifierProvider);

  int total = 0;

  for (Product product in cartProduct) {
    total += product.price;
  }

  return total;
}

