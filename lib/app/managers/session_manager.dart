import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SessionManager {
  late final GetStorage _getStorage;

  SessionManager(this._getStorage);

  final RxList<int> favorites = RxList();

  void loadSession() {
    final result = _getStorage.read('favoriteId');
    if (result != null) {
      favorites(result);
    }
  }

  void setFavorite(int id) {
    if (favorites.value.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    _getStorage.write('favoriteId', favorites.value);
  }
}
