import 'package:dota_v2_pepe/app/const/app_color.dart';
import 'package:dota_v2_pepe/app/const/app_constant.dart';
import 'package:dota_v2_pepe/app/const/hero_portrait.dart';
import 'package:dota_v2_pepe/app/data/models/dota_heroes_model.dart';
import 'package:dota_v2_pepe/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:dota_v2_pepe/app/const/primaryattr_extension.dart';
import 'package:dota_v2_pepe/app/const/atk_type_extension.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    super.key,
    required this.information,
  });

  final DotaHeroes information;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: Image.network(
              HeroPortrait.heroPortrait +
                  (information.img ?? '').split('/').last.split('?').first,
              width: MediaQuery.of(context).size.width / 1.3,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(
                      information.primaryAttr?.imageName ?? '',
                      width: 32,
                      height: 32,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      (information.primaryAttr?.fullPrimaryAttrName ?? '')
                          .toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                  ),
                  child: Text(
                    (information.localizedName ?? '').toUpperCase(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'ATTACK TYPE',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            information.attackType?.imageName ?? '',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            information.attackType?.name
                                    .toString()
                                    .toUpperCase() ??
                                '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AttributeWidget extends StatelessWidget {
  const AttributeWidget({
    super.key,
    required this.information,
  });

  final DotaHeroes information;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF252728), Color(0xFF101415)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'ATTRIBUTE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Image.network(
                          AppConstant.baseDotaHeroUrl + (information.img ?? ''),
                          fit: BoxFit.cover,
                          width: 160,
                          height: 90,
                        ),
                        Container(
                          width: 160,
                          height: 24,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF286323), Color(0xFF7AF03C)],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 160,
                                    child: Text(
                                      information.health().toStringAsFixed(0),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    width: 160,
                                    child: Text(
                                      '+ ${information.healthRegen().toStringAsFixed(1)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.tertiaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 24,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF1056DB), Color(0xFF73F5FE)],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 160,
                                    child: Text(
                                      information.mana().toStringAsFixed(0),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 160,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '+ ${information.manaRegen().toStringAsFixed(1)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.tertiaryColor,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                ImageName.heroStrength,
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              information.baseStr.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Text(
                              ' + ${information.strGain.toString()}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.secondaryColor,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                ImageName.heroAgility,
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              information.baseAgi.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Text(
                              ' + ${information.agiGain.toString()}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.secondaryColor,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                ImageName.heroIntelligence,
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              information.baseInt.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Text(
                              ' + ${information.intGain.toString()}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.secondaryColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RolesWidget extends StatelessWidget {
  const RolesWidget({
    super.key,
    required this.information,
  });

  final DotaHeroes information;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF252728), Color(0xFF101415)],
        ),
      ),
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'ROLES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 16,
              ),
              child: Center(
                child: Row(
                  children: [
                    _roleText(
                      role: 'Carry',
                      checkedColor: information.roles?.contains('Carry'),
                    ),
                    _roleText(
                      role: 'Support',
                      checkedColor: information.roles?.contains('Support'),
                    ),
                    _roleText(
                      role: 'Nuker',
                      checkedColor: information.roles?.contains('Nuker'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 16,
              ),
              child: Center(
                child: Row(
                  children: [
                    _roleText(
                      role: 'Disabler',
                      checkedColor: information.roles?.contains('Disabler'),
                    ),
                    _roleText(
                      role: 'Jungler',
                      checkedColor: information.roles?.contains('Jungler'),
                    ),
                    _roleText(
                      role: 'Durable',
                      checkedColor: information.roles?.contains('Durable'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 16,
              ),
              child: Center(
                child: Row(
                  children: [
                    _roleText(
                      role: 'Escape',
                      checkedColor: information.roles?.contains('Escape'),
                    ),
                    _roleText(
                      role: 'Pusher',
                      checkedColor: information.roles?.contains('Pusher'),
                    ),
                    _roleText(
                      role: 'Initiator',
                      checkedColor: information.roles?.contains('Initiator'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _roleText({required String role, required bool? checkedColor}) {
    return Expanded(
      child: Text(
        role,
        style: TextStyle(
          color: checkedColor == true
              ? AppColors.primaryColor
              : AppColors.tertiaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class StatsWidget extends StatelessWidget {
  const StatsWidget({
    super.key,
    required this.information,
  });

  final DotaHeroes information;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF252728), Color(0xFF101415)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'STATS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageName.iconDamage,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                _statText(
                                    stat:
                                        '${information.attackMin().toStringAsFixed(0)}-${information.attackMax().toStringAsFixed(0)}'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageName.iconAttackRate,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                _statText(
                                  stat: information.attackRate.toString(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageName.iconAttackRange,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                _statText(
                                  stat: information.attackRange.toString(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageName.iconProjectileSpeed,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                _statText(
                                  stat: information.projectileSpeed.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageName.iconArmor,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                _statText(
                                  stat: information.armor().toStringAsFixed(1),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageName.iconMagicResist,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                _statText(stat: '25%'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageName.iconMovementSpeed,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                _statText(
                                  stat: information.moveSpeed.toString(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageName.iconTurnRate,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                information.turnRate != null
                                    ? _statText(
                                        stat: information.turnRate.toString(),
                                      )
                                    : _statText(stat: '-'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageName.iconVision,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                _statText(
                                  stat:
                                      '${information.dayVision.toString()}/${information.nightVision.toString()}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _statText({required String stat}) {
    return Text(
      stat,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    );
  }
}
