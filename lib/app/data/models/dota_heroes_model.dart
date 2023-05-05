import 'package:dota_v2_pepe/app/const/atk_type.dart';
import 'package:dota_v2_pepe/app/const/primaryattr.dart';
import 'package:get/get.dart';

class DotaHeroes {
  int? id;
  String? name;
  String? localizedName;
  String? _primaryAttr;
  String? _attackType;
  List<String>? roles;
  String? img;
  String? icon;
  double? baseHealth;
  double? baseHealthRegen;
  double? baseMana;
  double? baseManaRegen;
  double? baseArmor;
  double? baseMr;
  double? baseAttackMin;
  double? baseAttackMax;
  int? baseStr;
  int? baseAgi;
  int? baseInt;
  double? strGain;
  double? agiGain;
  double? intGain;
  int? attackRange;
  int? projectileSpeed;
  double? attackRate;
  int? baseAttackTime;
  double? attackPoint;
  int? moveSpeed;
  dynamic turnRate;
  bool? cmEnabled;
  int? legs;
  int? dayVision;
  int? nightVision;
  int? heroId;
  int? turboPicks;
  int? turboWins;
  int? proBan;
  int? proWin;
  int? proPick;
  int? i1Pick;
  int? i1Win;
  int? i2Pick;
  int? i2Win;
  int? i3Pick;
  int? i3Win;
  int? i4Pick;
  int? i4Win;
  int? i5Pick;
  int? i5Win;
  int? i6Pick;
  int? i6Win;
  int? i7Pick;
  int? i7Win;
  int? i8Pick;
  int? i8Win;
  int? nullPick;
  int? nullWin;

  DotaHeroes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    _primaryAttr = json['primary_attr'];
    _attackType = json['attack_type'];
    roles = json['roles'].cast<String>();
    img = json['img'];
    icon = json['icon'];
    baseHealth = (json['base_health'] as num?)?.toDouble();
    baseHealthRegen = (json['base_health_regen'] as num?)?.toDouble();
    baseMana = (json['base_mana'] as num?)?.toDouble();
    baseManaRegen = (json['base_mana_regen'] as num?)?.toDouble();
    baseArmor = (json['base_armor'] as num?)?.toDouble();
    baseMr = (json['base_mr'] as num?)?.toDouble();
    baseAttackMin = (json['base_attack_min'] as num?)?.toDouble();
    baseAttackMax = (json['base_attack_max'] as num?)?.toDouble();
    baseStr = json['base_str'];
    baseAgi = json['base_agi'];
    baseInt = json['base_int'];
    strGain = (json['str_gain'] as num?)?.toDouble();
    agiGain = (json['agi_gain'] as num?)?.toDouble();
    intGain = (json['int_gain'] as num?)?.toDouble();
    attackRange = json['attack_range'];
    projectileSpeed = json['projectile_speed'];
    attackRate = (json['attack_rate'] as num?)?.toDouble();
    baseAttackTime = json['base_attack_time'];
    attackPoint = (json['attack_point'] as num?)?.toDouble();
    moveSpeed = json['move_speed'];
    turnRate = json['turn_rate'];
    cmEnabled = json['cm_enabled'];
    legs = json['legs'];
    dayVision = json['day_vision'];
    nightVision = json['night_vision'];
    heroId = json['hero_id'];
    turboPicks = json['turbo_picks'];
    turboWins = json['turbo_wins'];
    proBan = json['pro_ban'];
    proWin = json['pro_win'];
    proPick = json['pro_pick'];
    i1Pick = json['1_pick'];
    i1Win = json['1_win'];
    i2Pick = json['2_pick'];
    i2Win = json['2_win'];
    i3Pick = json['3_pick'];
    i3Win = json['3_win'];
    i4Pick = json['4_pick'];
    i4Win = json['4_win'];
    i5Pick = json['5_pick'];
    i5Win = json['5_win'];
    i6Pick = json['6_pick'];
    i6Win = json['6_win'];
    i7Pick = json['7_pick'];
    i7Win = json['7_win'];
    i8Pick = json['8_pick'];
    i8Win = json['8_win'];
    nullPick = json['null_pick'];
    nullWin = json['null_win'];
  }

  double health() {
    return (baseHealth ?? 0.0) + ((baseStr as num).toDouble() * 20.0);
  }

  double healthRegen() {
    return (baseHealthRegen ?? 0.0) + ((baseStr as num).toDouble() * 0.1);
  }

  double mana() {
    return (baseMana ?? 0.0) + ((baseInt as num).toDouble() * 12.0);
  }

  double manaRegen() {
    return (baseManaRegen ?? 0.0) + ((baseInt as num).toDouble() * 0.05);
  }

  double armor() {
    return (baseArmor ?? 0.0) + ((baseAgi as num).toDouble() * 0.167);
  }

  double attackMin() {
    switch (primaryAttr) {
      case PrimaryAttr.str:
        return (baseAttackMin ?? 0.0) + (baseStr as num).toDouble();
      case PrimaryAttr.agi:
        return (baseAttackMin ?? 0.0) + (baseAgi as num).toDouble();
      case PrimaryAttr.int:
        return (baseAttackMin ?? 0.0) + (baseInt as num).toDouble();
      default:
        return (baseAttackMin ?? 0.0);
    }
  }

  double attackMax() {
    switch (primaryAttr) {
      case PrimaryAttr.str:
        return (baseAttackMax ?? 0.0) + (baseStr as num).toDouble();
      case PrimaryAttr.agi:
        return (baseAttackMax ?? 0.0) + (baseAgi as num).toDouble();
      case PrimaryAttr.int:
        return (baseAttackMax ?? 0.0) + (baseInt as num).toDouble();
      default:
        return (baseAttackMax ?? 0.0);
    }
  }
}

extension DotaHeroExtension on DotaHeroes {
  PrimaryAttr? get primaryAttr {
    return PrimaryAttr.values.firstWhereOrNull((e) => e.name == _primaryAttr);
  }

  AtackType? get attackType {
    return AtackType.values.firstWhereOrNull((e) => e.name == _attackType);
  }
}
