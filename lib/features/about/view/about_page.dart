import 'package:blocgorouter/config/router_config.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_bloc.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_state.dart';
import 'package:blocgorouter/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = context.read<AuthenticationBloc>().state.maybeMap(
          // TODO(jnikki): add test for authenticated user
          authenticated: (Authenticated a) => a.user, // coverage:ignore-line
          orElse: () => null,
        );
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.aboutAppBarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(authenticatedUser?.id ?? ''),
            Text(authenticatedUser?.name ?? ''),
            Text(authenticatedUser?.email ?? ''),
            ElevatedButton(
              onPressed: () => context.go(Routes.home),
              child: const Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }
}
