// coverage:ignore-file

import 'package:blocgorouter/config/firebase_config.dart';
import 'package:blocgorouter/config/router_config.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_bloc.dart';
import 'package:blocgorouter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    initFirebase();

    // to add more embedding MultiRepositoryProvider
    // could wrap MultiBlocProvider

    return MultiBlocProvider(
      // add top level blocs here
      providers: [
        BlocProvider<AuthenticationBloc>(create: (_) => AuthenticationBloc()),
      ],
      child: const RealApp(),
    );
  }
}

// To get context propagated right I needed to create new class
// It is to me unclear why this was the case, but as the result
// authentication bloc is higher than router at widget tree, and stays there
class RealApp extends StatelessWidget {
  const RealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router(context),
    );
  }
}
