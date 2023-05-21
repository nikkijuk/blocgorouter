import 'package:blocgorouter/domain/authentication/authenticated_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unknown() = Unknown;
  const factory AuthenticationState.authenticated(AuthenticatedUser user) =
      Authenticated;
  const factory AuthenticationState.unauthenticated() = Unauthenticated;
}
