import 'package:dota_v2_pepe/app/const/app_constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SessionManager {
  late final GetStorage _getStorage;

  SessionManager(this._getStorage);

  final RxList<int> favorites = RxList();

  void loadSession() {
    final result = _getStorage.read(AppConstant.favoriteId);
    if (result is List) {
      favorites.value = result.whereType<int>().toList();
    }
  }

  void setFavorite(int id) {
    if (favorites.value.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    _getStorage.write(AppConstant.favoriteId, favorites.value);
  }
}
