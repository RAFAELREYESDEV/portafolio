import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_app/main.dart';

void main() {
  testWidgets('Carga inicial de la app de portafolio', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.text('CYBER STATION HUB'), findsOneWidget);
  });
}
