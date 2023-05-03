import 'package:dio/dio.dart';
import 'package:dota_v2_pepe/app/const/app_color.dart';
import 'package:dota_v2_pepe/app/core/api/dota_hero_api.dart';
import 'package:dota_v2_pepe/app/core/routers/dio_client.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await _setupInstance();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: AppColors.primaryBlack),
      ),
    ),
  );
}

Future<void> _setupInstance() async {
  Get.put(Dio());

  final Dio dio = Get.find();
  Get.put(
    DioClient(
      dio,
    ),
  );

  final DioClient dioClient = Get.find();
  Get.put(DotaHeroAPI(dioClient));

  return;
}
