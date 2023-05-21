import 'package:blocgorouter/app/app.dart';
import 'package:blocgorouter/config/firebase_config.dart';
import 'package:blocgorouter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets(
      'renders CounterPage',
      (tester) async {
        await initFirebase();

        await tester.pumpWidget(const App());

        // router redirect brings user to login page
        expect(find.byType(CounterPage), findsNothing);
        //expect(find.byType(UserSignInPage), findsOneWidget);
      },
      skip: true,
    );
  });
}
