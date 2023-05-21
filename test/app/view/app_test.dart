import 'package:blocgorouter/app/app.dart';
import 'package:blocgorouter/domain/authentication/authenticated_user.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_bloc.dart';
import 'package:blocgorouter/features/authentication/bloc/authentication_event.dart';
import 'package:blocgorouter/features/counter/view/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    testWidgets(
      'renders CounterPage',
      (tester) async {
        const user = AuthenticatedUser(id: '123');

        await tester.pumpAuthenticatedApp(
          const App(),
          AuthenticationBloc()..add(const LogIn(user)),
        );

        // router redirect brings user to login page
        expect(find.byType(CounterPage), findsNothing);
        //expect(find.byType(UserSignInPage), findsOneWidget);
      },
      skip: true,
    );
  });
}
