import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocgorouter/domain/authentication/authenticated_user.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_event.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const Unknown()) {
    on<LogIn>(_login);
    on<LogOut>(_logout);
  }

  FutureOr<void> _login(LogIn event, Emitter<AuthenticationState> emit) {
    state.maybeWhen(
      unknown: () => emit(Authenticated(event.user)),
      orElse: () {}, // coverage:ignore-line
    );
  }

  FutureOr<void> _logout(LogOut event, Emitter<AuthenticationState> emit) {
    state.maybeWhen(
      authenticated: (AuthenticatedUser user) {
        emit(const Unauthenticated());
        emit(const Unknown());
      },
      orElse: () {}, // coverage:ignore-line
    );
  }
}
