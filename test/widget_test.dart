import 'package:flutter_test/flutter_test.dart';

import 'package:tractian_challenge/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TractianChallenge());
  });
}
