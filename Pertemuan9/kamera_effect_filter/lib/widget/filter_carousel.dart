import 'dart:io';

import 'package:flutter/material.dart';

import 'filter_selector.dart';

class PhotoFilterCarousel
    extends StatefulWidget {

  const PhotoFilterCarousel({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  State<PhotoFilterCarousel>
      createState() =>
          _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState
    extends State<PhotoFilterCarousel> {

  final _filters = [
    Colors.white,

    ...List.generate(
      Colors.primaries.length,

      (index) => Colors.primaries[
          (index * 4) %
              Colors.primaries.length
      ],
    ),
  ];

  final _filterColor =
      ValueNotifier<Color>(
    Colors.white,
  );

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: _buildPhoto(),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,

            child:
                _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoto() {

    return ValueListenableBuilder<Color>(
      valueListenable: _filterColor,

      builder:
          (context, color, child) {

        return Image.file(
          File(widget.imagePath),

          fit: BoxFit.cover,

          color:
              color.withOpacity(0.5),

          colorBlendMode:
              BlendMode.color,
        );
      },
    );
  }

  Widget _buildFilterSelector() {

    return FilterSelector(
      filters: _filters,

      imagePath:
          widget.imagePath,

      onFilterChanged:
          _onFilterChanged,
    );
  }
}