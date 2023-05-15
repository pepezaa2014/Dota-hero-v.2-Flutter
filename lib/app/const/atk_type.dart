import 'package:dota_v2_pepe/resources/resources.dart';

enum ATKType {
  melee,
  ranged,
}

extension AtackTypeExtension on ATKType {
  String get atkName {
    switch (this) {
      case ATKType.melee:
        return 'Melee';
      case ATKType.ranged:
        return 'Ranged';
    }
  }

  String get imageName {
    switch (this) {
      case ATKType.melee:
        return ImageName.melee;
      case ATKType.ranged:
        return ImageName.ranged;
    }
  }
}
