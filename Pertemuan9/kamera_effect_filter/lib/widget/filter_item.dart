import 'dart:io';

import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {

  const FilterItem({
    super.key,
    required this.color,
    required this.imagePath,
  });

  final Color color;

  final String imagePath;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
          const EdgeInsets.all(8),

      child: ClipOval(
        child: Image.file(
          File(imagePath),

          fit: BoxFit.cover,

          color:
              color.withOpacity(0.5),

          colorBlendMode:
              BlendMode.hardLight,
        ),
      ),
    );
  }
}