import 'package:dota_v2_pepe/app/const/primaryattr.dart';
import 'package:dota_v2_pepe/app/core/api/dota_hero_api.dart';
import 'package:dota_v2_pepe/app/data/models/dota_heroes_model.dart';
import 'package:dota_v2_pepe/app/extensions/bool_extension.dart';
import 'package:dota_v2_pepe/app/managers/session_manager.dart';
import 'package:dota_v2_pepe/app/routes/app_pages.dart';
import 'package:dota_v2_pepe/app/utils/show_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final DotaHeroAPI _dotaHeroAPI = Get.find();
  final SessionManager _sessionManager = Get.find();

  late final RxList<int> favorites;
  final Rxn<PrimaryAttr> filterPrimaryAttr = Rxn();

  final RxBool isFavorite = false.obs;
  final RxBool isSortClicked = false.obs;
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
    favorites = _sessionManager.favorites;
  }

  @override
  void onReady() {
    super.onReady();
    getHeroes();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  Future<void> refresh() async {
    getHeroes();
  }

  void goToHeroDetail(DotaHeroes characterDetail) {
    Get.toNamed(
      Routes.DOTA_HERO_DETAIL,
      arguments: characterDetail,
    );
  }

  void getHeroes() async {
    try {
      isLoadingGetHeroes(true);
      print(isLoadingGetHeroes.value);

      final result = await _dotaHeroAPI.getHeroes();
      dotaHeroes.value = result;
    } catch (error) {
      showAlertError(
        error: error,
      );
    } finally {
      isLoadingGetHeroes(false);
      print(isLoadingGetHeroes.value);
    }
  }

  void setFilterPrimaryAttr(PrimaryAttr filter) {
    if (filterPrimaryAttr.value == filter) {
      filterPrimaryAttr.value = null;
    } else {
      filterPrimaryAttr.value = filter;
    }
  }
}
