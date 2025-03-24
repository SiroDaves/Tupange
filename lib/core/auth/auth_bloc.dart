import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepo})
      : _authRepo = authRepo,
        super(XAuthState.unauthenticated()) {
    on<AuthStatusChanged>(_onAuthStatusChanged);
    on<AuthSignoutRequested>(_onAuthSignoutRequested);

    _authStatusSubscription = _authRepo.status.listen(
      (status) => add(AuthStatusChanged(status)),
    );
  }

  final AuthRepository _authRepo;
  late StreamSubscription<AuthStatus> _authStatusSubscription;

  Future<void> _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return emit(XAuthState.unauthenticated());
      case AuthStatus.authenticated:
        return emit(XAuthState.authenticated());
    }
  }

  void _onAuthSignoutRequested(
    AuthSignoutRequested event,
    Emitter<AuthState> emit,
  ) {
    _authRepo.signout();
  }

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }
}
