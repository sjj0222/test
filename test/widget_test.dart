import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_counter/main.dart';

void main() {
  testWidgets('Counter increments when tapping the + button',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const CounterApp());

    // Verify the counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' (FloatingActionButton) and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify the counter has incremented to 1.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter resets to 0 when tapping the Reset button',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const CounterApp());

    // Tap '+' a couple of times so the counter is no longer 0.
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify the counter is now 2.
    expect(find.text('2'), findsOneWidget);
    expect(find.text('0'), findsNothing);

    // Tap the Reset button and trigger a frame.
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // Verify the counter has reset to 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('2'), findsNothing);
  });
}
