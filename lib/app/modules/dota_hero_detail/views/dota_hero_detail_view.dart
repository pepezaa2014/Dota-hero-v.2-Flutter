import 'package:dota_v2_pepe/app/const/app_color.dart';
import 'package:dota_v2_pepe/app/modules/widget/detail_widget.dart';
import 'package:dota_v2_pepe/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dota_hero_detail_controller.dart';

class DotaHeroDetailView extends GetView<DotaHeroDetailController> {
  const DotaHeroDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

  _appbar() {
    return AppBar(
      title: Image.asset(
        ImageName.dota2Logo,
        height: 40,
      ),
      centerTitle: true,
      actions: [
        Obx(
          () {
            final isFavorite = controller.favorites.value
                .contains(controller.informationHero.id);
            return IconButton(
              onPressed: () => controller.setThisFavorite(),
              icon: isFavorite
                  ? const Icon(
                      CupertinoIcons.heart_fill,
                    )
                  : const Icon(
                      CupertinoIcons.heart,
                    ),
              iconSize: 24,
              color: Colors.white,
            );
          },
        ),
      ],
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageName.background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            HeadWidget(
              information: controller.informationHero,
            ),
            AttributeWidget(
              information: controller.informationHero,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF252728), Color(0xFF101415)],
                ),
              ),
              child: const Divider(
                color: AppColors.secondaryColor,
                thickness: 1,
              ),
            ),
            RolesWidget(
              information: controller.informationHero,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF252728), Color(0xFF101415)],
                ),
              ),
              child: const Divider(
                color: AppColors.secondaryColor,
                thickness: 1,
              ),
            ),
            StatsWidget(
              information: controller.informationHero,
            ),
          ],
        ),
      ),
    );
  }
}
