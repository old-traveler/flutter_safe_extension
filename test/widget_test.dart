// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'dart:ui';
import 'package:flutter_safe_extension/dart_safe_extension.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    int a = 1;
    print(a?.let((it) => '非null'));
  });
}
