import 'package:dota_v2_pepe/resources/resources.dart';

enum PrimaryAttr {
  str,
  agi,
  int,
  all,
}

extension PrimaryAttrExtension on PrimaryAttr {
  String get imageName {
    switch (this) {
      case PrimaryAttr.str:
        return ImageName.heroStrength;
      case PrimaryAttr.agi:
        return ImageName.heroAgility;
      case PrimaryAttr.int:
        return ImageName.heroIntelligence;
      case PrimaryAttr.all:
        return ImageName.heroUniversal;
    }
  }

  String get fullPrimaryAttrName {
    switch (this) {
      case PrimaryAttr.str:
        return 'Strength';
      case PrimaryAttr.agi:
        return 'Agility';
      case PrimaryAttr.int:
        return 'Intelligence';
      case PrimaryAttr.all:
        return 'Universal';
    }
  }
}
