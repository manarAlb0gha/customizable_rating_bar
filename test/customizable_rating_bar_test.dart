import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:customizable_rating_bar/customizable_rating_bar.dart';

void main() {
  testWidgets('Default rating bar renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomizableRatingBar(rating: 3.0),
        ),
      ),
    );

    expect(find.byIcon(Icons.star), findsNWidgets(3));
    expect(find.byIcon(Icons.star_border), findsNWidgets(2));
  });

  testWidgets('Rating updates on tap', (WidgetTester tester) async {
    double newRating = 0.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomizableRatingBar(
            rating: 0.0,
            onRatingUpdate: (rating) => newRating = rating,
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.star_border).first);
    expect(newRating, 1.0);
  });

}