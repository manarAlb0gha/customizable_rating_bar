import 'package:flutter/material.dart';

/// A highly customizable rating bar widget for Flutter applications.
///
/// This widget allows users to display and select ratings using customizable
/// icons (like stars, hearts, etc.) with support for half ratings and various
/// visual customization options.
class CustomizableRatingBar extends StatefulWidget {
  /// The current rating value (can be whole or half numbers like 3.0 or 3.5)
  final double rating;

  /// The total number of rating items to display (defaults to 5)
  final int itemCount;

  /// The size of each rating item in logical pixels (defaults to 40.0)
  final double itemSize;

  /// The color of filled rating items (defaults to amber)
  final Color filledColor;

  /// The color of unfilled rating items (defaults to grey)
  final Color unfilledColor;

  /// Whether to allow half ratings (like 3.5) (defaults to false)
  final bool allowHalfRating;

  /// Callback when the rating changes
  final ValueChanged<double>? onRatingUpdate;

  /// The icon to use for filled rating items (defaults to Icons.star)
  final IconData filledIcon;

  /// The icon to use for unfilled rating items (defaults to Icons.star_border)
  final IconData unfilledIcon;

  /// Creates a customizable rating bar widget
  ///
  /// [rating] is the initial rating value
  /// [itemCount] determines how many rating items to show
  /// [itemSize] controls the size of each rating item
  /// [filledColor] sets the color of selected rating items
  /// [unfilledColor] sets the color of unselected rating items
  /// [allowHalfRating] enables/disables half ratings
  /// [onRatingUpdate] callback when user changes the rating
  /// [filledIcon] icon for selected rating items
  /// [unfilledIcon] icon for unselected rating items
  const CustomizableRatingBar({
    Key? key,
    this.rating = 0.0,
    this.itemCount = 5,
    this.itemSize = 40.0,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
    this.allowHalfRating = false,
    this.onRatingUpdate,
    this.filledIcon = Icons.star,
    this.unfilledIcon = Icons.star_border,
  }) : super(key: key);

  @override
  _CustomizableRatingBarState createState() => _CustomizableRatingBarState();
}

class _CustomizableRatingBarState extends State<CustomizableRatingBar> {
  late double _currentRating;
  final GlobalKey _rowKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  /// Updates the rating based on tap or drag position
  void _updateRating(Offset position) {
    final box = _rowKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;

    final pos = box.globalToLocal(position);
    // Calculate which item we're touching (0-based index)
    double itemIndex = pos.dx / widget.itemSize;
    double rating;

    if (widget.allowHalfRating) {
      // For half ratings:
      // - First half of star (0.0-0.5) → 0.5
      // - Second half of star (0.5-1.0) → 1.0
      double fractionalPart = itemIndex - itemIndex.floor();
      if (fractionalPart < 0.5) {
        rating = itemIndex.floor() + 0.5;
      } else {
        rating = itemIndex.floor() + 1.0;
      }
    } else {
      // For whole ratings, round up to nearest integer
      rating = itemIndex.ceilToDouble();
    }

    // Clamp the rating between 0 and itemCount
    rating = rating.clamp(0, widget.itemCount.toDouble());

    setState(() {
      _currentRating = rating;
    });

    widget.onRatingUpdate?.call(_currentRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      key: _rowKey,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.itemCount, (index) {
        return GestureDetector(
          onTapDown: (details) => _updateRating(details.globalPosition),
          onHorizontalDragUpdate: (details) =>
              _updateRating(details.globalPosition),
          child: _buildIcon(index + 1),
        );
      }),
    );
  }

  /// Builds an individual rating icon with appropriate styling
  Widget _buildIcon(int position) {
    IconData iconData;
    Color color;

    if (position <= _currentRating) {
      iconData = widget.filledIcon;
      color = widget.filledColor;
    } else if (position - 0.5 <= _currentRating && widget.allowHalfRating) {
      iconData = widget.filledIcon;
      color = widget.filledColor.withValues(alpha: 0.5);
    } else {
      iconData = widget.unfilledIcon;
      color = widget.unfilledColor;
    }

    return Icon(
      iconData,
      size: widget.itemSize,
      color: color,
    );
  }
}
