import 'package:flutter_test/flutter_test.dart';
import 'package:bajeti_buddy/main.dart';

void main() {
  testWidgets('shows startup text', (tester) async {
    await tester.pumpWidget(const BajetiBuddyApp());
    await tester.pumpAndSettle();
    expect(find.text('BajetiBuddy up and running 🎉'), findsOneWidget);
  });
}
