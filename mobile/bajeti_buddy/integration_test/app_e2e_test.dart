import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bajeti_buddy/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('launches and shows text', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('BajetiBuddy up and running 🎉'), findsOneWidget);
  });
}
