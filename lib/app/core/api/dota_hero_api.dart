import 'package:dio/dio.dart';
import 'package:dota_v2_pepe/app/core/routers/dio_client.dart';
import 'package:dota_v2_pepe/app/core/routers/dota_hero_router.dart';
import 'package:dota_v2_pepe/app/data/models/dota_heroes_model.dart';
import 'package:dota_v2_pepe/app/core/handle_exceptions.dart';

class DotaHeroAPI {
  final DioClient _dioClient;

  DotaHeroAPI(this._dioClient);

  Future<List<DotaHeroes>> getHeroes() async {
    try {
      final Response response = await _dioClient.get(
        DotaHeroRouter.getHero,
      );
      List<DotaHeroes> result = [];
      if (response.data is List) {
        response.data.forEach((e) {
          result.add(DotaHeroes.fromJson(e));
        });
      }
      return result;
    } catch (e) {
      throw HandleExceptions.handleError(e);
    }
  }
}
