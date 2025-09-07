import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arenapredict/app/app.dart';

void main() {
  testWidgets('App shows title', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ArenaPredictApp()));
    expect(find.text('ArenaPredict'), findsOneWidget);
  });
}
