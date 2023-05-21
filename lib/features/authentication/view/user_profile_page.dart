// coverage:ignore-file

import 'package:blocgorouter/config/router_config.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_bloc.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_event.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserProfileView();
  }
}

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      providers: const [],
      actions: [
        SignedOutAction(
          (context) {
            BlocProvider.of<AuthenticationBloc>(context).add(const LogOut());
            context.go(Routes.home);
          },
        ),
      ],
    );
  }
}
