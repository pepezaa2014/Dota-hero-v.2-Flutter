import 'package:dota_v2_pepe/app/data/models/dota_heroes_model.dart';
import 'package:dota_v2_pepe/app/managers/session_manager.dart';
import 'package:get/get.dart';

class DotaHeroDetailController extends GetxController {
  late final DotaHeroes informationHero;
  final SessionManager _sessionManager = Get.find();

  late final RxList<int> favorites;

  @override
  void onInit() {
    super.onInit();
    informationHero = Get.arguments;
    favorites = _sessionManager.favorites;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setThisFavorite() {
    final id = informationHero.id;
    if (id != null) {
      _sessionManager.setFavorite(id);
    }
  }
}
