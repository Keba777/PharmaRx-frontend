import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/main.dart';

void main() {
  testWidgets('App initializes without crashing', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Verify that the MaterialApp.router widget exists
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
