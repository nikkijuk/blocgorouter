// coverage:ignore-file
// code coverage is ignored as navigation is tested with mocked routes

import 'dart:async';

import 'package:blocgorouter/domain/authentication/authenticated_user.dart';
import 'package:blocgorouter/features/about/view/about_page.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_bloc.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_state.dart';
import 'package:blocgorouter/features/authentication/view/forgot_password_page.dart';
import 'package:blocgorouter/features/authentication/view/user_profile_page.dart';
import 'package:blocgorouter/features/authentication/view/user_signin_page.dart';
import 'package:blocgorouter/features/counter/view/counter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Routes as constants, so that they can used for Apps logic.
class Routes {
  static const home = '/';
  static const counter = '/counter';
  static const about = '/about';
  static const login = '/login';
  static const logout = '/logout';
  static const profile = '/profile';
  static const forgotPasswordName = '/forgot/';
  static const forgotPassword = '/forgot/:email';
}

// routes as simple list, so that they can be used
// for building router configuration and for tests.
List<GoRoute> routes() => [
      GoRoute(
        path: Routes.home,
        builder: (_, __) => const CounterPage(),
      ),
      GoRoute(
        path: Routes.about,
        builder: (_, __) => const AboutPage(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (_, __) => const UserSignInPage(),
      ),
      GoRoute(
        path: Routes.profile,
        builder: (_, __) => const UserProfilePage(),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => ForgotPasswordPage(
          state.uri.queryParameters['email']!,
        ),
      ),
    ];

// redirect and finding blocs needs build context
GoRouter router(BuildContext ctx) => GoRouter(
      redirect: (context, state) {
        // get state from authentication bloc
        final state = BlocProvider.of<AuthenticationBloc>(context).state;

        // equivalent to using read
        // final state = context.read<AuthenticationBloc>().state;

        // is state is authenticated just set flag here
        final userAuthenticated = state.maybeWhen(
          authenticated: (AuthenticatedUser _) => true,
          orElse: () => false,
        );

        final target = state.maybeWhen(
          // no need to redirect
          authenticated: (AuthenticatedUser user) => null,
          // when user is not authenticated go login
          orElse: () => Routes.login,
        );

        // TODO(jnikki): add proper logging
        debugPrint('userAuthenticated: $userAuthenticated, target: $target');

        return target;
      },
      refreshListenable:
          GoRouterRefreshBloc<AuthenticationBloc, AuthenticationState>(
        BlocProvider.of<AuthenticationBloc>(ctx),
      ),
      routes: routes(),
    );

// GoRouterRefreshStream is removed from Go Router v5
// but one can easily make fork of it
// or write own version of it

// please see discussion here
// https://github.com/flutter/flutter/issues/108128
// https://github.com/csells/go_router/discussions/122

/// Converts a [Stream] into a [Listenable]
///
/// {@tool snippet}
/// Typical usage is as follows:
///
/// ```dart
/// GoRouter(
///  refreshListenable: GoRouterRefreshStream(stream),
/// );
/// ```
/// {@end-tool}
class GoRouterRefreshStream extends ChangeNotifier {
  /// Creates a [GoRouterRefreshStream].
  ///
  /// Every time the [stream] receives an event the [GoRouter] will refresh its
  /// current route.
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// GoRouterRefreshBloc is funny gateway from stream to listenable
// but now we have blocs and states typed properly

class GoRouterRefreshBloc<BLOC extends BlocBase<STATE>, STATE>
    extends ChangeNotifier {
  GoRouterRefreshBloc(BLOC bloc) {
    _blocStream = bloc.stream.listen(
      (STATE _) => notifyListeners(),
    );
  }

  late final StreamSubscription<STATE> _blocStream;

  @override
  void dispose() {
    _blocStream.cancel();
    super.dispose();
  }
}
