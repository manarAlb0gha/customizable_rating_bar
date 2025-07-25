# Customizable Rating Bar for Flutter

[![pub package](https://img.shields.io/pub/v/customizable_rating_bar.svg)](https://pub.dev/packages/customizable_rating_bar)

A highly customizable rating widget for Flutter applications with support for various icons, sizes, and interactive features.

## Features

- Customizable icons (stars, hearts, etc.)
- Adjustable size and colors
- Support for half ratings
- Interactive rating updates
- Horizontal drag support for precise rating

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  customizable_rating_bar: ^1.1.3
```

## Usage

```dart
import 'package:customizable_rating_bar/customizable_rating_bar.dart';

// Basic star rating
CustomizableRatingBar(
  rating: 3.5,
  onRatingUpdate: (rating) => print(rating),
  allowHalfRating: true,
)

// Custom heart rating
CustomizableRatingBar(
  rating: 2.0,
  itemCount: 7,
  filledIcon: Icons.favorite,
  unfilledIcon: Icons.favorite_border,
  filledColor: Colors.red,
  unfilledColor: Colors.grey,
)
```

## Parameters

| Parameter         | Description                          | Default       |
|-------------------|--------------------------------------|---------------|
| rating           | Current rating value                | 0.0           |
| itemCount        | Number of rating items              | 5             |
| itemSize         | Size of each icon                   | 40.0          |
| filledColor      | Color for filled icons              | Colors.amber  |
| unfilledColor    | Color for unfilled icons            | Colors.grey   |
| allowHalfRating  | Whether to allow half ratings       | false         |
| onRatingUpdate   | Callback when rating changes        | null          |
| filledIcon       | Icon for filled items               | Icons.star    |
| unfilledIcon     | Icon for unfilled items             | Icons.star_border |#   c u s t o m i z a b l e _ r a t i n g _ b a r 
 
 