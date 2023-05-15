
import 'package:dota_v2_pepe/app/const/app_constant.dart';
import 'package:dota_v2_pepe/app/const/primaryattr.dart';
import 'package:dota_v2_pepe/app/data/models/dota_heroes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotaHeroCard extends StatelessWidget {
  const DotaHeroCard({
    Key? key,
    required this.information,
    required this.onTap,
    required this.isFavorite,
  }) : super(key: key);

  final DotaHeroes information;
  final Function() onTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 2),
                  blurRadius: 3,
                ),
              ],
            ),
            child: GridTile(
              header: Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    isFavorite ? CupertinoIcons.heart_fill : null,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              footer: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                ),
                child: GridTileBar(
                  leading: Image.asset(
                    information.primaryAttr?.imageName ?? '',
                    width: 24,
                    height: 24,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          information.localizedName.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              child: Image.network(
                AppConstant.baseDotaHeroUrl + (information.img ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
