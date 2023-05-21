import 'package:blocgorouter/app/app.dart';
import 'package:blocgorouter/config/firebase_config.dart';
import 'package:blocgorouter/counter/counter.dart';
import 'package:blocgorouter/features/authentication/view/user_signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      initFirebase();

      await tester.pumpWidget(const App());

      // router redirect brings user to login page
      expect(find.byType(CounterPage), findsNothing);
      //expect(find.byType(UserSignInPage), findsOneWidget);
    }, skip: true);

  });
}
