import 'package:ecommerce_app/src/features/authentication/presentation/account/account_screen_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late AccountScreenController controller;

  setUp(() {
    authRepository = MockAuthRepository();
    controller = AccountScreenController(
      authRepository: authRepository,
    );
  });

  group('AccountScreenController', () {
    test('initial state is AsyncValue.data', () {
      verifyNever(authRepository.signOut);
      expect(controller.debugState, const AsyncData<void>(null));
    });

    test('signOut success', () async {
      when(authRepository.signOut).thenAnswer((_) => Future.value());

      await controller.signOut();
      expect(controller.debugState, const AsyncData<void>(null));
      verify(authRepository.signOut).called(1);
    });

    test('signOut failure', () async {
      final exception = Exception('Connection failed');
      when(authRepository.signOut).thenThrow(exception);

      await controller.signOut();
      verify(authRepository.signOut).called(1);
      expect(controller.debugState.hasError, true);
      expect(controller.debugState, isA<AsyncError>());
    });
  });
}
