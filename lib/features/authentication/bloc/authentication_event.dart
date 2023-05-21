import 'package:blocgorouter/domain/authentication/authenticated_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_event.freezed.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.login(AuthenticatedUser user) = LogIn;
  const factory AuthenticationEvent.logout() = LogOut;
}
