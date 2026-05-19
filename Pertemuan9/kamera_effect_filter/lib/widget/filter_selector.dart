import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'carousel_flowdelegate.dart';
import 'filter_item.dart';

class FilterSelector
    extends StatefulWidget {

  const FilterSelector({
    super.key,
    required this.filters,
    required this.onFilterChanged,
    required this.imagePath,
  });

  final List<Color> filters;

  final String imagePath;

  final void Function(Color)
      onFilterChanged;

  @override
  State<FilterSelector>
      createState() =>
          _FilterSelectorState();
}

class _FilterSelectorState
    extends State<FilterSelector> {

  static const _filtersPerScreen = 5;

  static const _viewportFraction =
      1 / _filtersPerScreen;

  late PageController _controller;

  int _page = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      initialPage: _page,
      viewportFraction:
          _viewportFraction,
    );

    _controller.addListener(
      _onPageChanged,
    );
  }

  void _onPageChanged() {

    final page =
        (_controller.page ?? 0).round();

    if (page != _page) {

      _page = page;

      widget.onFilterChanged(
        widget.filters[page],
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 150,

      child: PageView.builder(
        controller: _controller,

        itemCount:
            widget.filters.length,

        itemBuilder:
            (context, index) {

          return FilterItem(
            color:
                widget.filters[index],

            imagePath:
                widget.imagePath,
          );
        },
      ),
    );
  }
}