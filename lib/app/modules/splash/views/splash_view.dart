import 'package:dota_v2_pepe/app/const/app_color.dart';
import 'package:dota_v2_pepe/resources/resources.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: Center(
        child: Image.asset(
          controller.logoName,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
