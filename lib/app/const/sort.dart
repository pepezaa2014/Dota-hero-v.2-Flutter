import 'package:flutter/material.dart';

enum SortPrimryAttr {
  str,
  agi,
  int,
  all,
}

extension SortPrimaryAttrExtension on SortPrimryAttr {
  Opacity get opacityIcon {
    switch (this) {
      case SortPrimryAttr.str:
        return const Opacity(opacity: 0.25);
      case SortPrimryAttr.agi:
        return const Opacity(opacity: 0.25);
      case SortPrimryAttr.int:
        return const Opacity(opacity: 0.25);
      case SortPrimryAttr.all:
        return const Opacity(opacity: 0.25);
    }
  }
}
