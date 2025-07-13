# Changelog

## [1.1.1] - 2025-07-13

### Added
- Initial release of customizable rating bar widget
- Support for custom icons (stars, hearts, etc.)
- Configurable colors for filled and unfilled states
- Adjustable item size and count
- Half-rating capability (`allowHalfRating` parameter)
- Interactive rating updates via taps and drags
- Comprehensive documentation and examples

### Features
- 🎨 Fully customizable appearance
- ⭐ Default star rating implementation
- ↔️ Horizontal drag support for precise rating
- 🖱️ Tap and drag gesture support
- 📱 Responsive design for all screen sizes

### Example Usage
```dart
CustomizableRatingBar(
  rating: 3.5,
  itemCount: 5,
  itemSize: 40.0,
  filledColor: Colors.amber,
  unfilledColor: Colors.grey,
  allowHalfRating: true,
  onRatingUpdate: (rating) {
    print('Updated rating: $rating');
  },
)