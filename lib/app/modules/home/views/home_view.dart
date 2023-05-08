import 'package:dota_v2_pepe/app/const/app_color.dart';
import 'package:dota_v2_pepe/app/data/models/dota_heroes_model.dart';
import 'package:dota_v2_pepe/app/utils/loading_indicator.dart';
import 'package:dota_v2_pepe/app/widget/dota_hero_card.dart';
import 'package:dota_v2_pepe/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
            appBar: _appbar(),
            body: _body(),
          ),
          Obx(() => loadingIndicator(controller.isLoading.value))
        ],
      ),
    );
  }

  _body() {
    return Obx(
      () {
        final dotaHeroes = controller.dotaHeroes;
        final sort = controller.isSort.value;
        final searchHeroText = controller.searchHeroName.value;

        List<DotaHeroes> dotaHeroList = dotaHeroes;

        if (sort == false) {
          dotaHeroList
              .sort((a, b) => a.localizedName!.compareTo(b.localizedName!));
        } else {
          dotaHeroList
              .sort((a, b) => b.localizedName!.compareTo(a.localizedName!));
        }

        if (searchHeroText.isNotEmpty) {
          dotaHeroList = dotaHeroList
              .where((e) =>
                  e.localizedName
                      ?.toLowerCase()
                      .contains(searchHeroText.toLowerCase()) ??
                  false)
              .toList();
        }

        if (controller.isFavorite.value) {
          dotaHeroList = dotaHeroList
              .where((e) => controller.favorites.contains(e.id))
              .toList();
        }

        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageName.background,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 16 / 9,
              ),
              itemCount: dotaHeroList.length,
              itemBuilder: (context, index) {
                return DotaHeroCard(
                  information: dotaHeroList[index],
                  onTap: () => controller.goToHeroDetail(dotaHeroList[index]),
                );
              },
            ),
          ),
        );
      },
    );
  }

  _appbar() {
    return AppBar(
      elevation: 0.0,
      title: Image.asset(
        ImageName.dota2Logo,
        height: 32,
        fit: BoxFit.cover,
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      ImageName.heroStrength,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      ImageName.heroAgility,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      ImageName.heroIntelligence,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      ImageName.heroUniversal,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Obx(
                            () {
                              return IconButton(
                                onPressed: () => controller.isSort.toggle(),
                                icon: controller.isSort.value
                                    ? const Icon(
                                        CupertinoIcons.sort_up,
                                      )
                                    : const Icon(
                                        CupertinoIcons.sort_down,
                                      ),
                                iconSize: 32,
                                color: Colors.white,
                              );
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Obx(
                            () {
                              return IconButton(
                                onPressed: () => controller.isFavorite.toggle(),
                                icon: controller.isFavorite.value
                                    ? const Icon(
                                        CupertinoIcons.heart_fill,
                                      )
                                    : const Opacity(
                                        opacity: 0.25,
                                        child: Icon(
                                          CupertinoIcons.heart_fill,
                                        ),
                                      ),
                                iconSize: 24,
                                color: Colors.white,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                top: 8,
                bottom: 8,
              ),
              child: TextField(
                controller: controller.searchHeroTextController,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.tertiaryColor,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 24,
                    color: AppColors.secondaryColor,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
