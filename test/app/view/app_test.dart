import 'package:blocgorouter/app/app.dart';
import 'package:blocgorouter/features/counter/view/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    testWidgets(
      'renders CounterPage',
      (tester) async {
        await tester.pumpApp(
          const App(),
        );

        // router redirect brings user to login page
        expect(find.byType(CounterPage), findsNothing);
        //expect(find.byType(UserSignInPage), findsOneWidget);
      },
      skip: true,
    );
  });
}
