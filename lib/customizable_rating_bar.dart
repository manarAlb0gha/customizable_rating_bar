/// A Flutter package for creating customizable rating bars.
///
/// This package provides a flexible rating widget that supports:
/// - Custom icons (stars, hearts, etc.)
/// - Half ratings (like 3.5 stars)
/// - Fully customizable colors and sizes
/// - Interactive rating selection
///
/// ## Usage
/// ```dart
/// CustomizableRatingBar(
///   rating: 3.5,
///   onRatingUpdate: (rating) => print(rating),
///   allowHalfRating: true,
/// )
/// ```
library customizable_rating_bar;

export 'src/customizable_rating_bar.dart';
