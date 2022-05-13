import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Fake Products Repository', () {
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
        productRepository.getProduct('100'),
        null,
      );
    });

    test('fetchProductsList returns global list', () async {
      final productsRepository = FakeProductsRepository();
      expect(
        await productsRepository.fetchProductsList(),
        kTestProducts,
      );
    });

    test('watchProductList emits global list', () {
      final productsRepository = FakeProductsRepository();
      expect(productsRepository.watchProductsList(), emits(kTestProducts));
    });

    test('watchProduct(1) emits first item', () {
      final productsRepository = FakeProductsRepository();
      expect(productsRepository.watchProduct('1'), emits(kTestProducts[0]));
    });

    test('watchProduct(100) emits null', () {
      final productsRepository = FakeProductsRepository();
      expect(productsRepository.watchProduct('100'), emits(null));
    });
  });
}
