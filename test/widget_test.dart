// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pratovaptvupt/main.dart';

void main() {
  testWidgets('App inicializa corretamente', (WidgetTester tester) async {
    // Constrói nosso app e dispara um frame
    await tester.pumpWidget(ReceitasApp());

    // Verifica se o título do app está presente
    expect(find.text('Prato Vapt Vupt'), findsOneWidget);
  });
}
