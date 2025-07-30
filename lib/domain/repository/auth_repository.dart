import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../core/utils/app_utils.dart';

enum AuthStatus { authenticated, unauthenticated }

@lazySingleton
class AuthRepository {
  final _controller = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 3));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> signin() async {
    AppUtils.logger("User auth status: Authenticated");
    await Future.delayed(
      const Duration(seconds: 2),
      () => _controller.add(AuthStatus.authenticated),
    );
  }

  Future<void> signout() async {
    AppUtils.logger("User auth status: Unauthenticated");
    await Future.delayed(
      const Duration(seconds: 2),
      () => _controller.add(AuthStatus.unauthenticated),
    );
  }

  void dispose() => _controller.close();
}
