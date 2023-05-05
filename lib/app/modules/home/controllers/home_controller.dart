import 'package:dota_v2_pepe/app/core/api/dota_hero_api.dart';
import 'package:dota_v2_pepe/app/data/models/dota_heroes_model.dart';
import 'package:dota_v2_pepe/app/extensions/bool_extension.dart';
import 'package:dota_v2_pepe/app/routes/app_pages.dart';
import 'package:dota_v2_pepe/app/utils/show_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final DotaHeroAPI _dotaHeroAPI = Get.find();

  final RxBool isFavorite = false.obs;
  final RxBool isSort = false.obs;
  final RxString searchHeroName = ''.obs;

  final RxList<DotaHeroes> dotaHeroes = RxList();

  final searchHeroTextController = TextEditingController();

  final isLoadingGetHeroes = false.obs;

  RxBool get isLoading {
    return [
      isLoadingGetHeroes.value,
    ].atLeastOneTrue.obs;
  }

  @override
  void onInit() {
    super.onInit();
    searchHeroTextController.addListener(
      () {
        searchHeroName.value = searchHeroTextController.text;
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    _getHeroes();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void goToHeroDetail(DotaHeroes characterDetail) {
    Get.toNamed(
      Routes.DOTA_HERO_DETAIL,
      arguments: characterDetail,
    );
  }

  void _getHeroes() async {
    try {
      isLoadingGetHeroes(true);
      final result = await _dotaHeroAPI.getHeroes();
      isLoadingGetHeroes(false);
      dotaHeroes.value = result;
    } catch (error) {
      isLoadingGetHeroes(false);
      showAlertError(
        error: error,
      );
    }
  }
}
