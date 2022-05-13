import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getProductsList returns global list', () {
    final productRepository = FakeProductsRepository();
    expect(productRepository.getProductsList(), kTestProducts);
  });

  test('getProduct(1) returns first item', () {
    final productRepository = FakeProductsRepository();
    expect(
      productRepository.getProduct('1'),
      kTestProducts[0],
    );
  });

  test('getProduct(100) returns null', () {
    final productRepository = FakeProductsRepository();
    expect(
      () => productRepository.getProduct('100'),
      throwsStateError,
    );
  });
}
