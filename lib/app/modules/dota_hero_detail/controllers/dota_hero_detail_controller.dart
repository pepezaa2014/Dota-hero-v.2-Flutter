import 'package:dota_v2_pepe/app/data/models/dota_heroes_model.dart';
import 'package:get/get.dart';

class DotaHeroDetailController extends GetxController {
  late final DotaHeroes informationHero;

  @override
  void onInit() {
    super.onInit();
    informationHero = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
