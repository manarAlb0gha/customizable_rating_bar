import 'package:flutter/material.dart';
import 'package:customizable_rating_bar/customizable_rating_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customizable Rating Bar Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RatingDemo(),
    );
  }
}

class RatingDemo extends StatefulWidget {
  const RatingDemo({super.key});

  @override
  State<RatingDemo> createState() => _RatingDemoState();
}

class _RatingDemoState extends State<RatingDemo> {
  double _rating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rating Bar Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Default Star Rating:'),
            CustomizableRatingBar(
              rating: _rating,
              onRatingUpdate: (rating) => setState(() => _rating = rating),
              allowHalfRating: true,
            ),
            const SizedBox(height: 30),
            const Text('Custom Heart Rating:'),
            CustomizableRatingBar(
              rating: _rating,
              itemCount: 5,
              itemSize: 30,
              filledIcon: Icons.favorite,
              unfilledIcon: Icons.favorite_border,
              allowHalfRating: true,
              filledColor: Colors.red,
              unfilledColor: Colors.grey,
              onRatingUpdate: (rating) => setState(() => _rating = rating),
            ),
            const SizedBox(height: 30),
            Text('Current Rating: $_rating', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}