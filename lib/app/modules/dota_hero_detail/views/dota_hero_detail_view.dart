import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dota_hero_detail_controller.dart';

class DotaHeroDetailView extends GetView<DotaHeroDetailController> {
  const DotaHeroDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DotaHeroDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DotaHeroDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
