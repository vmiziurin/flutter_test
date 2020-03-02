import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:randomcolor/main.dart';

void main() {
  testWidgets('Codelab smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(new RandomColorApp());
    expect(find.text('Hey there'), findsOneWidget);
  });
}
