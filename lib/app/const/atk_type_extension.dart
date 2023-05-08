import 'package:dota_v2_pepe/resources/resources.dart';

enum AtackType {
  melee,
  ranged,
}

extension AtackTypeExtension on AtackType {
  String get name {
    switch (this) {
      case AtackType.melee:
        return 'Melee';
      case AtackType.ranged:
        return 'Ranged';
    }
  }

  String get imageName {
    switch (this) {
      case AtackType.melee:
        return ImageName.melee;
      case AtackType.ranged:
        return ImageName.ranged;
    }
  }
}
